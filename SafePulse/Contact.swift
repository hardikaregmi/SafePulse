import Foundation

struct Contact: Identifiable, Codable {
    var id = UUID()
    var name: String
    var phone: String
}
