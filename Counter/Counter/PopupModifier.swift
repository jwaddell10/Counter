import SwiftData
import SwiftUI

extension View {
    func popup<Content: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: () -> Content
    ) -> some View {
        self.overlay {
            if isPresented.wrappedValue {
                ZStack {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                        .onTapGesture {
                            isPresented.wrappedValue = false
                        }
                    content()
                }
            }
        }
    }
}
