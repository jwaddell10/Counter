import Foundation
import SwiftData

class DataController {
    static let previewContainer: ModelContainer = {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: CounterItem.self, configurations: config)
            
            let sampleItems = [
                CounterItem(name: "Coffee", count: 0, timestamp: Date()),
                CounterItem(name: "Water", count: 0, timestamp: Date()),
                CounterItem(name: "Steps", count: 0, timestamp: Date())
            ]
            
            sampleItems.forEach { container.mainContext.insert($0) }
            
            return container
        } catch {
            fatalError("Failed to create preview container: \(error)")
        }
    }()
}
