import SwiftUI

struct HomeContainerView: View {
    @EnvironmentObject private var store: Store<Home.State, Home.Action>

    var body: some View {
        Group {
            if !store.state.hasFetchedAlbums {
                ProgressView()
                    .onAppear {
                        fetchAlbums()
                    }
            } else {
                if store.state.albums.count == 0 {
                    Text("No albums")
                } else {
                    HomeView(albums: store.state.albums)
                }
            }
        }
        .navigationTitle("Albums")
    }

    private func fetchAlbums() {
        store.send(.fetchAlbums)
    }
}
