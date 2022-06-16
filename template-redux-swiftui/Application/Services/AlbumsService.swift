import Combine
import Foundation

protocol AlbumsService: AnyObject {
    func getAlbums() -> AnyPublisher<[Album], Error>
}

final class AlbumsServiceImpl: AlbumsService {
    func getAlbums() -> AnyPublisher<[Album], Error> {
        guard let url = URL(string: "https://1979673067.rsc.cdn77.org/music-albums.json")   // I usually use 'Endpoint' objects to carry requests information
        else { return Empty(completeImmediately: true).eraseToAnyPublisher() }

        // This is a simple implementation. The service should be calling a 'Network' or 'APIClient' object to hanble requests (in which, you could choose http method, http and parsing errors would be handled, etc).
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                do {
                    let albums = try JSONDecoder().decode([Album].self, from: data)
                    return albums
                }
                catch {
                    throw error
                }
            }
            .eraseToAnyPublisher()
    }

    /// A real implementation would look something like this:
    /// func getAlbums() -> AnyPublisher<[Album], Error> {
    ///     let endpoint = Endpoint.getAlbums
    ///
    ///     return network.get(type: [Album].self, url: endpoint.url, headers: endpoint.headers)
    ///         .tryMap { try $0.toModel() }
    ///         .eraseToAnyPublisher()
    ///}
}
