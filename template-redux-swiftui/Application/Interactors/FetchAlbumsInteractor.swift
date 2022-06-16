import Combine

protocol FetchAlbumsInteractor: AnyObject {
    func fetchAlbums() -> AnyPublisher<[Album], Error>
}

final class FetchAlbumsInteractorImpl: FetchAlbumsInteractor {
    let service: AlbumsService

    init(service: AlbumsService) {
        self.service = service
    }

    func fetchAlbums() -> AnyPublisher<[Album], Error> {
        return service.getAlbums()
//            .tryMap { try $0.toModel() }  /// There should be a mapping throughout layers but as stated in the 'Album' model, we will use a single model here.
            .eraseToAnyPublisher()
    }
}
