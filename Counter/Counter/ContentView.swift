import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var counterEntries: [CounterEntry]

    @State private var showingAddItem = false
    @State private var counterName = ""

    @State private var itemToDelete: CounterItem?

    var body: some View {
        NavigationStack {
            List(
                counterEntries.filter {
                    Calendar.current.isDateInToday($0.date)
                }
            ) { entry in
                if let item = entry.item {
                    CounterRowView(item: item, count: entry)
                }
            }
            .navigationTitle("My Counter Items")
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    NavigationLink(destination: CounterItemGraphView()) {
                        Image(systemName: "chart.bar.xaxis")
                            .padding(8)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }

                    Button {
                        showingAddItem = true
                        counterName = ""
                    } label: {
                        Image(systemName: "plus")
                            .padding(8)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
            .popup(isPresented: $showingAddItem) {
                AddCounterView(isPresented: $showingAddItem)
            }
        }
    }
}

#Preview {
    ContentView().modelContainer(DataController.previewContainer)
}
