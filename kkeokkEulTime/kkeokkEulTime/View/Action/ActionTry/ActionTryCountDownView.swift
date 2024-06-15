import SwiftUI
import Combine

struct ActionTryCountDownView: View {
    @State private var countdown: Int = 3
    @State private var cancellable: AnyCancellable? = nil
    
    let action: ActionModel
    
    var body: some View {
        ZStack {
            Image(action.readyImage)
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 4)
            
            VStack(spacing: 16) {
                VStack(spacing: 0) {
                    Text("자, 준비 되었나요?")
                        .font(.custom(Pretendard.regular.rawValue, size: 22))
                        .foregroundColor(Color(hex: "F4F6E9"))
                        .padding(.top, 60)
                    
                    HStack(spacing: 0) {
                        Text("진동이 울리면 ")
                            .foregroundColor(.white)
                        Text("시작")
                            .foregroundColor(.green)
                        Text("돼요")
                            .foregroundColor(.white)
                    }
                    .font(.custom(Pretendard.bold.rawValue, size: 30))
                    .padding(.top, 1)
                }
                
                Text("\(action.selectionTitle) | \(action.actionCount)회")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.white)
                    .overlay {
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 187, height: 32)
                            .foregroundStyle(.white.opacity(0.12))
                    }
                
                Spacer()
                
                Text(action.readySentence)
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.bottom)
            }
            
            Text("\(countdown)")
                .font(.system(size: 270, weight: .bold))
                .foregroundColor(.white)
                .transition(.scale)
        }
        .onAppear {
            cancellable?.cancel()
            SoundManager.shared.playSound(sounds: .countDown)
            let timerPublisher = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
            
            cancellable = timerPublisher
                        .scan(3) { counter, _ in
                            counter - 1
                        }
                        .sink { count in
                            countdown = count
                            SoundManager.shared.playSound(sounds: .countDown)
                            HapticManager.shared.impact(style: .medium)
                            
                            if count == 1 {
                                self.cancellable?.cancel()
                                NavigationManager.shared.push(to: .actionTry(actionModel: action))
                            }
                        }
        }
    }
}

#Preview {
    ActionTryCountDownView(action: ActionModel.details.first!)
}
