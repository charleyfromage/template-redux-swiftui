import SwiftUI

@main
struct template_redux_swiftuiApp: App {
    let store: Store = Store(initialState: Application.State(), reducer: applicationReducer, environment: Application.Environment())

    var body: some Scene {
        WindowGroup {
            ApplicationContainerView().environmentObject(store)
        }
    }
}
