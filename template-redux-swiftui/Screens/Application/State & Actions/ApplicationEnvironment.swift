extension Application {
    struct Environment: EnvironmentInterface {
        let fetchItemsInteractor: FetchItemsInteractor

        init() {
            self.fetchItemsInteractor = FetchItemsInteractorImpl(service: ItemsServiceImpl())
        }
    }
}
