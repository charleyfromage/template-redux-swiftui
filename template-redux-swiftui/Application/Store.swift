import SwiftUI
import Combine

final class Store<State, Action>: ObservableObject {
    @Published private(set) var state: State

    private let reduce: (inout State, Action) -> AnyPublisher<Action, Never>
    private var cancellables: Set<AnyCancellable> = []

    init<Environment>(initialState: State, reducer: Reducer<State, Action, Environment>, environment: Environment) {
        state = initialState
        reduce = { state, action in
            reducer.reduce(&state, action, environment)
        }
    }

    func send(_ action: Action) {
        reduce(&state, action)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: send)
            .store(in: &cancellables)
    }

    func subStore<LocalState, LocalAction>(subState: @escaping (State) -> LocalState, action: @escaping (LocalAction) -> Action) -> Store<LocalState, LocalAction> {
        let localState = subState(state)
        let localStore = Store<LocalState, LocalAction>(initialState: localState,
                                                        reducer: Reducer { [weak self] _, localAction, _ in
                                                            self?.send(action(localAction))

                                                            return Empty().eraseToAnyPublisher()
                                                        },
                                                        environment: ())

        $state
            .sink { [weak localStore] state in
                localStore?.state = subState(state)
            }
            .store(in: &cancellables)

        return localStore
    }
}

extension Store {
    func connect<C: Connector>(using connector: C) -> Store<C.LocalState, C.LocalAction> where C.ApplicationState == State, C.ApplicationAction == Action {
        return subStore(subState: connector.connect(state: ), action: connector.connect(localAction: ))
    }
}
