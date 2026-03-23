import SwiftData
import SwiftUI

struct CounterItemDetailView: View {
    @Bindable var item: CounterItem
    @Bindable var count: CounterEntry

    @State private var showEditSheet = false
    @State private var showResetPopup = false

    var body: some View {
        NavigationStack {
            Button {
                count.count += 1  // or whatever tap action you want
            } label: {
                Text("\(count.count)")
                    .font(.custom("HelveticaNeue", fixedSize: 200))
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button("Edit Tally") {
                            showEditSheet = true
                        }
                        Button("Reset Tally") {
                            showResetPopup = true
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                }
            }
            .navigationTitle(item.name)
        }
        .sheet(isPresented: $showEditSheet) {
            EditTallySheet(item: item, count: count)
        }
        .popup(isPresented: $showResetPopup, width: 300, height: 200) {
            VStack(spacing: 20) {
                Text("Reset Tally?")
                    .font(.headline)
                    .padding(.top)

                Text("Are you sure you want to reset \"\(item.name)\" to 0?")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)

                Divider()

                HStack(spacing: 12) {
                    Button("Cancel") {
                        showResetPopup = false
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)

                    Button("Reset") {
                        count.count = 0
                        showResetPopup = false
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .background(Color(UIColor.systemBackground))
            .cornerRadius(20)
            .shadow(radius: 20)
        }
    }
}

struct EditTallySheet: View {
    @Environment(\.dismiss) private var dismiss
    let item: CounterItem
    let count: CounterEntry
    // Local state for editing
    @State private var editedName: String
    @State private var editedCount: Int

    init(item: CounterItem, count: CounterEntry) {
        self.item = item
        self.count = count
        // Initialize state with current values
        _editedName = State(initialValue: item.name)
        _editedCount = State(initialValue: count.count)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Tally Details") {
                    TextField("Name", text: $editedName)
                    Stepper(
                        "Count: \(editedCount)",
                        value: $editedCount,
                        in: 0...999
                    )
                }
            }
            .navigationTitle("Edit Tally")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        // Save changes to the item
                        item.name = editedName
                        count.count = editedCount
                        dismiss()
                    }
                    .disabled(editedName.isEmpty)
                }
            }
        }
    }
}
