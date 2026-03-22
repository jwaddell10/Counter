import SwiftData
import SwiftUI

struct CounterRowView: View {
    @Environment(\.modelContext) private var modelContext
    let item: CounterItem
    @State private var showingDeleteAlert = false

    var body: some View {
        HStack {
            Button("-") {
                item.count -= 1
                try? modelContext.save()
            }
            .buttonStyle(.bordered)

            VStack {
                Text(item.name)
                Text("\(item.count)")
            }
            .frame(maxWidth: .infinity)

            Button("+") {
                item.count += 1
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
                try? modelContext.save()
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Are you sure you want to delete \"\(item.name)\"?")
        }
    }
}
