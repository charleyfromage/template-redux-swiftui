import SwiftUI

struct HomeView: View {
    let albums: [Album]

    @State private var searchText = ""

    /// I'm gonna go ahead and use a simple var here though the rule to filter should be injected to the view to keep the view independant of business.
    var searchResults: [Album] {
        if searchText.isEmpty {
            return albums
        } else {
            /// We could use a more complex regex here, but for the sake of simplicity this should do the trick.
            return albums.filter { ($0.name ?? "").lowercased().contains(searchText.lowercased())
                || ($0.artist ?? "").lowercased().contains(searchText.lowercased())
                || $0.tracks.joined().lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        List {
            ForEach(searchResults, id: \.self) { album in
                NavigationLink(destination: DetailsView(album: album)) {
                    Text(album.name ?? "")
                }
            }
        }
        .searchable(text: $searchText)
    }
}
