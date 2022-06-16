import Foundation

struct Item: Identifiable, Hashable {
    let id = UUID()
    var name: String
}
