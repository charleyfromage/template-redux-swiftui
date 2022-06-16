extension Application {
    struct Environment: EnvironmentInterface {
        let fetchAlbumsInteractor: FetchAlbumsInteractor

        init() {
            self.fetchAlbumsInteractor = FetchAlbumsInteractorImpl(service: AlbumsServiceImpl())
        }
    }
}
