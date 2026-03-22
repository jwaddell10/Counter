import SwiftData
import SwiftUI

struct AddCounterView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var isPresented: Bool
    @State private var counterName = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("New Counter")
                .font(.headline)

            TextField("Counter Name", text: $counterName)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            HStack {
                Button("Cancel") {
                    isPresented = false
                }
                .buttonStyle(BorderedButtonStyle())
                Spacer()
                Button("Save") {
                    saveCounterItem()
                }
                .buttonStyle(BorderedButtonStyle())
            }
            .padding(.horizontal)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
    }
    
    func saveCounterItem() {
        let newItem = CounterItem(
            name: counterName,
            count: 0,
            timestamp: Date()
        )
        modelContext.insert(newItem)
        isPresented = false
    }
}
