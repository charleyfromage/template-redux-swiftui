import SwiftUI

struct HomeContainerView: View {
    @EnvironmentObject private var store: Store<Home.State, Home.Action>

    var body: some View {
        Group {
            if !store.state.hasFetchedItems {
                ProgressView()
                    .onAppear {
                        fetchItems()
                    }
            } else {
                if store.state.items.count == 0 {
                    Text("No items")
                } else {
                    HomeView(items: store.state.items)
                }
            }
        }
        .navigationTitle("Items")
    }

    private func fetchItems() {
        store.send(.fetchItems)
    }
}
