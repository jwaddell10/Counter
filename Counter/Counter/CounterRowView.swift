import SwiftData
import SwiftUI

struct CounterRowView: View {
    @Environment(\.modelContext) private var modelContext
    let item: CounterItem
    let count: CounterEntry
    @State private var showingDeleteAlert = false

    var body: some View {
        HStack {
            Button("-") {
                count.count -= 1
                try? modelContext.save()
            }
            .buttonStyle(.bordered)

            NavigationStack {
                NavigationLink(destination: CounterItemDetailView(item: item, count: count)) {
                    VStack {
                        Text(item.name)
                        Text("\(count.count)")
                    }
                    .frame(maxWidth: .infinity)
                }
            }

            Button("+") {
                count.count += 1
                try? modelContext.save()
            }
            .buttonStyle(.bordered)
        }
        .swipeActions(edge: .trailing) {
            Button("Delete") {
                showingDeleteAlert = true
            }
        }
        .alert("Delete Counter?", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive) {
                modelContext.delete(item)
                modelContext.delete(count)
                try? modelContext.save()
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Are you sure you want to delete \"\(item.name)\"?")
        }
    }
}
