import Combine
import Foundation

protocol ItemsService: AnyObject {
    func getItems() -> AnyPublisher<[Item], Error>
}

final class ItemsServiceImpl: ItemsService {
    func getItems() -> AnyPublisher<[Item], Error> {
        return Just([Item(name: "Item 1"), Item(name: "Item 2"), Item(name: "Item 3"), Item(name: "Item 4")])
            .tryMap { $0 }  /// Would be where you handle parsing and errors
            .delay(for: 2, scheduler: RunLoop.main) /// To fake request delay
            .eraseToAnyPublisher()
    }
}
