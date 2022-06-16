extension Home {
    enum Action {
        case fetchItems
        case didFetchItems([Item])
        case doSomethingWithError(Error)
    }
}
