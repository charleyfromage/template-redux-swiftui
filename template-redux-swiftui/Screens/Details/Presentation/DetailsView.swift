import SwiftUI

struct DetailsView: View {
    var album: Album
    
    var body: some View {
        Text("Artist: \(album.artist ?? "")")
        Text("Label: \(album.label ?? "")")
        Text("Year: \(album.year ?? "")")
        List(album.tracks, id: \.self) { track in
            Text(track)
        }
        .navigationTitle(album.name ?? "")
    }
}
