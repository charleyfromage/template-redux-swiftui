import SwiftUI

struct ApplicationContainerView: View {
    @EnvironmentObject private var store: Store<Application.State, Application.Action>

    var body: some View {
        NavigationView {
            HomeContainerView().environmentObject(store.connect(using: Connectors.HomeConnector()))
        }
    }
}
