enum Connectors {}

protocol Connector {
    associatedtype ApplicationState
    associatedtype ApplicationAction
    associatedtype LocalState
    associatedtype LocalAction

    func connect(state: ApplicationState) -> LocalState
    func connect(localAction: LocalAction) -> ApplicationAction
}
