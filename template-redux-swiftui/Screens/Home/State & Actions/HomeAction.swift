extension Home {
    enum Action {
        case fetchAlbums
        case didFetchAlbums([Album])
        case doSomethingWithError(Error)
    }
}
