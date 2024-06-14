import SwiftUI
import AVKit

struct ActionTutorialView: View {
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
                VideoPlayerView(player: player)
                    .onAppear {
                        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { _ in
                            NavigationManager.shared.push(to: .motionTry(actionModel: action))
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
                    NavigationManager.shared.push(to: .motionTry(actionModel: action))
                } label: {
                    Image("SkipButton")
                }
            }
            .padding(.bottom, 40)
            .padding()
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct VideoPlayerView: UIViewRepresentable {
    let player: AVPlayer

    func makeUIView(context: Context) -> UIView {
        return PlayerUIView(player: player)
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

class PlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()

    init(player: AVPlayer) {
        super.init(frame: .zero)
        self.playerLayer.player = player
        self.layer.addSublayer(playerLayer)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}

#Preview {
    ActionTutorialView(action: ActionModel.details.first!)
}
