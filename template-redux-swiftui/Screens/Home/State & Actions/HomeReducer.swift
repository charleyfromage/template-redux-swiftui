import Combine

let homeReducer: Reducer<Home.State, Home.Action, EnvironmentInterface> = Reducer { state, action, environment in
    switch action {
        case .fetchItems:
            return environment.fetchItemsInteractor.fetchItems()
                .map { items in
                    .didFetchItems(items)
                }
                .catch { error -> Just<Home.Action> in
                    return Just(.doSomethingWithError(error))
                }
                .eraseToAnyPublisher()

        case .didFetchItems(let items):
            state.hasFetchedItems = true
            state.items = items

        case .doSomethingWithError:
            state.hasFetchedItems = true
            /// Handle errors here
            /// Alternatively, errors can be intercepted at application level in the applicationReducer)
    }

    return Empty(completeImmediately: true).eraseToAnyPublisher()
}
