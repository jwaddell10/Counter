import Foundation
import SwiftData

@Model
class CounterItem {
    var name: String
    var count: Int
    var timestamp: Date

    init(name: String, count: Int, timestamp: Date) {
        self.name = name
        self.count = count
        self.timestamp = timestamp
    }
}
