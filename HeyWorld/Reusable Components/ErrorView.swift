import SwiftUI

struct ErrorView: View {
    let error: Error
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Text("Oops, an error occurred.")
                    Text("Try refreshing the page.")
                }
                .frame(width: geometry.size.width)
                .frame(minHeight: geometry.size.height)
            }
        }
    }
}
