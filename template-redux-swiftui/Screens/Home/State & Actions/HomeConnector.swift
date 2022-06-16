extension Connectors {
    struct HomeConnector: Connector {
        func connect(state: Application.State) -> Home.State {
            return state.home
        }

        func connect(localAction: Home.Action) -> Application.Action {
            return .homeAction(localAction)
        }
    }
}
