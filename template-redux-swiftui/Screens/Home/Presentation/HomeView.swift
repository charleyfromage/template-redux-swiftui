import SwiftUI

struct HomeView: View {
    let items: [Item]

    var body: some View {
        List(items, id: \.self) { item in
            NavigationLink(destination: DetailsView(itemName: item.name)) {
                Text(item.name)
            }
        }
    }
}
