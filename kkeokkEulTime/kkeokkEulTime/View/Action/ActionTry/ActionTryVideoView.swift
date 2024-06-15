import SwiftUI
import AVKit

struct ActionTryVideoView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var player: AVPlayer?
    
    let action: ActionModel

    init(action: ActionModel) {
        if let videoURL = Bundle.main.url(forResource: action.tutorialVideo, withExtension: "mp4") {
            player = AVPlayer(url: videoURL)
        }
        self.action = action
    }
    
    var body: some View {
        ZStack {
            if let player = player {
                VideoPlayer(player: player)
                    .ignoresSafeArea()
                    .onAppear {
                        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { _ in
                            NavigationManager.shared.push(to: .actionTryReady(actionModel: action))
                        }
                        player.play()
                    }
                    .onDisappear {
                        NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
                        player.pause()
                        self.player = nil
                    }
            } else {
                Text("비디오를 찾을 수 없습니다.")
            }
            
            VStack{
                Spacer()
                Button {
                    NavigationManager.shared.push(to: .actionTryReady(actionModel: action))
                } label: {
                    Image("SkipButton")
                }
            }
            .padding(.bottom, 40)
            .padding()
            .edgesIgnoringSafeArea(.all)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    NavigationManager.shared.pop(to: .actionSelection)
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .font(.system(size: 17))
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.vertical, 11)
                }
                .frame(width: 44, height: 44)
            }
        }
    }
}

#Preview {
    ActionTryVideoView(action: ActionModel.details.first!)
        .preferredColorScheme(.dark)
}
