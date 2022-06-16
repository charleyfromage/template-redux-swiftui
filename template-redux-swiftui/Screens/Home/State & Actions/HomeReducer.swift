import Combine

let homeReducer: Reducer<Home.State, Home.Action, EnvironmentInterface> = Reducer { state, action, environment in
    switch action {
        case .fetchAlbums:
            return environment.fetchAlbumsInteractor.fetchAlbums()
                .map { albums in
                    .didFetchAlbums(albums)
                }
                .catch { error -> Just<Home.Action> in
                    return Just(.doSomethingWithError(error))
                }
                .eraseToAnyPublisher()

        case .didFetchAlbums(let albums):
            state.hasFetchedAlbums = true
            state.albums = albums

        case .doSomethingWithError:
            state.hasFetchedAlbums = true
            /// Handle errors here
            /// Alternatively, errors can be intercepted at application level in the applicationReducer)
    }

    return Empty(completeImmediately: true).eraseToAnyPublisher()
}
