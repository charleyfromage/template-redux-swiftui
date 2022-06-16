import Combine

protocol FetchItemsInteractor: AnyObject {
    func fetchItems() -> AnyPublisher<[Item], Error>
}

final class FetchItemsInteractorImpl: FetchItemsInteractor {
    let service: ItemsService

    init(service: ItemsService) {
        self.service = service
    }

    func fetchItems() -> AnyPublisher<[Item], Error> {
        return service.getItems()
            .eraseToAnyPublisher()
    }
}
