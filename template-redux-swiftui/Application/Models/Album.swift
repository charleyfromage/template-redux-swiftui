/// There should be multiple layers of this object (DTO, Repository, Application). For the sake of simplicity here, I will use a single object.

struct Album: Identifiable, Hashable, Decodable {
    let id: String?
    let name: String?
    let artist: String?
    let label: String?
    let year: String?
    let tracks: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case name = "album"
        case artist
        case label
        case year
        case tracks
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decodeIfPresent(String.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        artist = try container.decodeIfPresent(String.self, forKey: .artist)
        label = try container.decodeIfPresent(String.self, forKey: .label)
        year = try container.decodeIfPresent(String.self, forKey: .year)
        tracks = try container.decodeIfPresent([String].self, forKey: .tracks) ?? []
    }
}
