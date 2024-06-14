import SwiftUI

struct MotionTryDetailView: View {
    @State private var countdown: Int? = nil

    var body: some View {
        ZStack {
            Image("All_fill")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("자, 준비 되었나요?")
                    .font(.system(size: 17))
                    .foregroundColor(.white)
                    .padding(.top, 100)
                
                HStack(spacing: 0) {
                    Text("진동이 울리면 ")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                    Text("시작")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.green)
                    Text("돼요")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                }
                .padding(.top, 1)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 300, height: 45)
                        .opacity(0.5)
                    Text("노려보자 카리나 | 10회")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                Text("팔을 뻗어서 스트레칭을 준비해주세요")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.bottom)
            }
            
            if let countdown = countdown, countdown > -1 {
                Text("\(countdown)")
                    .font(.system(size: 100, weight: .bold))
                    .foregroundColor(.white)
                    .transition(.scale)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation {
                                self.countdown = countdown - 1
                            }
                        }
                    }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.countdown = 3
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MotionTryDetailView()
}
