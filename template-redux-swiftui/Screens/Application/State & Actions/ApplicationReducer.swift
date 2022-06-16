import Combine

let applicationReducer: Reducer<Application.State, Application.Action, EnvironmentInterface> = Reducer { state, action, environment in
    switch action {
        case .homeAction(let action):
            if case let .doSomethingWithError(error) = action {
                /// Intercept error at application level
            }

            return homeReducer.reduce(&state.home, action, environment)
                .map { action -> Application.Action in
                    Application.Action.homeAction(action)
                }
                .eraseToAnyPublisher()
    }
}
