import SwiftData
import SwiftUI

struct AddCounterView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var isPresented: Bool
    @State private var counterName = ""

    var body: some View {
        ZStack {
            Color.blue.opacity(0.8)
                .frame(width: 300, height: 220)
                .cornerRadius(12)
            VStack {
                Form {
                    Section(header: Text("New Counter")) {
                        TextField("Counter Name", text: $counterName)
                    }
                }
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
        }
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
