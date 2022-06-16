import SwiftUI

struct DetailsView: View {
    var itemName: String
    
    var body: some View {
        Text("This is the item details view")
            .navigationTitle(itemName)
    }
}
