import Foundation
import SwiftData

@Model
class CounterItem {
    var id: UUID
    var name: String
    var createdAt: Date
    var isArchived: Bool
    var counterEntries: [CounterEntry] = []

    init(
        id: UUID = UUID(),
        name: String,
        createdAt: Date = Date(),
        isArchived: Bool = false
    ) {
        self.id = id
        self.name = name
        self.createdAt = createdAt
        self.isArchived = isArchived
    }
}

@Model
class CounterEntry {
    var date: Date
    var count: Int
    var item: CounterItem?

    init(date: Date, count: Int = 0, item: CounterItem) {
        self.date = date
        self.count = count
        self.item = item
    }
}
//need it to update daily, reset to 0 daily,
