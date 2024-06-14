import SwiftUI

struct MotionTryView: View {
    @State private var isActive = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image("MotionTry")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.top)
                    .navigationBarBackButtonHidden(true)
                
                NavigationLink(destination: MotionTryDetailView(), isActive: $isActive) {
                    EmptyView()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    MotionTryView()
}
