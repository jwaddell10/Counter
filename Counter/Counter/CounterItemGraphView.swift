import Charts
import SwiftData
import SwiftUI

struct CounterItemGraphView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [CounterItem]

    var body: some View {
        List {
            ForEach(items) { item in
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Chart {
                        ForEach(item.counterEntries) { entry in
                            BarMark(
                                x: .value("Date", entry.date),
                                y: .value("Count", entry.count)
                            )
                        }
                    }
                }
            }
        }
    }
}
