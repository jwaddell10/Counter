import Foundation
import SwiftData

class DataController {
    static let previewContainer: ModelContainer = {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(
                for: CounterItem.self,
                CounterEntry.self,
                configurations: config
            )

            let context = container.mainContext

            let calendar = Calendar.current
            let today = Date()

            func daysAgo(_ days: Int) -> Date {
                calendar.date(byAdding: .day, value: -days, to: today)!
            }

            // =========================
            // ☕ Coffee Data
            // =========================
            let coffee = CounterItem(name: "Coffee")

            let coffeeEntries = [
                CounterEntry(date: today, count: 3, item: coffee),
                CounterEntry(date: daysAgo(1), count: 2, item: coffee),
                CounterEntry(date: daysAgo(2), count: 4, item: coffee),
                CounterEntry(date: daysAgo(4), count: 1, item: coffee),
                CounterEntry(date: daysAgo(7), count: 5, item: coffee),
            ]

            coffee.counterEntries.append(contentsOf: coffeeEntries)

            // =========================
            // 💧 Water Data
            // =========================
            let water = CounterItem(name: "Water")

            let waterEntries = [
                CounterEntry(date: today, count: 4, item: water),
                CounterEntry(date: daysAgo(1), count: 6, item: water),
                CounterEntry(date: daysAgo(2), count: 7, item: water),
                CounterEntry(date: daysAgo(3), count: 5, item: water),
                CounterEntry(date: daysAgo(7), count: 10, item: water),
            ]

            water.counterEntries.append(contentsOf: waterEntries)

            // =========================
            // 👟 Steps Data
            // =========================
            let steps = CounterItem(name: "Steps")

            let stepsEntries = [
                CounterEntry(date: today, count: 8000, item: steps),
                CounterEntry(date: daysAgo(1), count: 9500, item: steps),
                CounterEntry(date: daysAgo(2), count: 7200, item: steps),
                CounterEntry(date: daysAgo(3), count: 11000, item: steps),
                CounterEntry(date: daysAgo(7), count: 6000, item: steps),
            ]

            steps.counterEntries.append(contentsOf: stepsEntries)

            // =========================
            // Insert everything
            // =========================
            let items = [coffee, water, steps]
            let allEntries = coffeeEntries + waterEntries + stepsEntries

            items.forEach { context.insert($0) }
            allEntries.forEach { context.insert($0) }

            return container
        } catch {
            fatalError("Failed to create preview container: \(error)")
        }
    }()
}
