import SwiftUI
import AVKit

struct ActionTutorialView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var player: AVPlayer?
    @State private var isVideoEnded = false
    @State private var isSkipButtonTapped = false

    var body: some View {
        NavigationStack{
                ZStack{
                if let videoURL = Bundle.main.url(forResource: "All", withExtension: "mp4") {
                    VideoPlayer(player: player)
                        .onAppear {
                            player = AVPlayer(url: videoURL)
                            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem, queue: .main) { _ in
                                isVideoEnded = true
                            }
                            player?.play()
                        }
                        .onDisappear {
                            NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem)
                        }
                } else {
                    Text("비디오 파일을 찾을 수 없습니다.")
                        .foregroundColor(.red)
                        .padding()
                }
                    VStack{
                        Spacer()
                        Button(action: {
                            isSkipButtonTapped = true
                        }) {
                            Image("SkipButton")
                        }
                    }
                    .padding(.bottom,20)
                .padding()
            }
            .background(
                NavigationLink(destination: MotionTryView(), isActive: $isVideoEnded) {
                    EmptyView()
                }
                    .hidden()
            )
            .background(
                NavigationLink(destination: MotionTryView(), isActive: $isSkipButtonTapped) {
                    EmptyView()
                }
                    .hidden()
            )
            .edgesIgnoringSafeArea(.all)
        }
    }
}


#Preview {
    ActionTutorialView()
}
