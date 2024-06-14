//
//  OnboardingMotionSecondView.swift
//  kkeokkEulTime
//
//  Created by 남유성 on 6/15/24.
//

import SwiftUI

struct OnboardingMotionSecondView: View {
    @State private var workItem: DispatchWorkItem?
    
    var body: some View {
        ZStack {
            Color(hex: "323232").ignoresSafeArea()
            
            VStack(spacing: 12) {
                Text("잡으셨나요?")
                    .font(.custom(Pretendard.semiBold.rawValue, size: 24))
                    .padding(.top, 44)
                
                VStack {
                    Text("그림에 손가락이 올라가도록")
                    Text("잡아주세요")
                }
                .font(.custom(Pretendard.regular.rawValue, size: 20))
                .padding(.bottom, 30)
                
                Image("Grip")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 462)
                
                Spacer()
                
                Button {
                    self.workItem?.cancel()
                    self.workItem = nil
                    NavigationManager.shared.push(to: .onboardingFinish)
                } label: {
                    HStack {
                        Spacer()
                        Text("튜토리얼 건너뛰기")
                            .font(.system(size: 20))
                            .bold()
                            .tint(.white)
                        Spacer()
                    }
                    .padding(.vertical, 16)
                }
                .background(Color(hex: "03C367"))

            }
            .foregroundStyle(.white)
        }
        .onAppear {
            let item = DispatchWorkItem {
                NavigationManager.shared.push(to: .onboardingMove)
            }
            self.workItem = item
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: item)
        }
    }
}

#Preview {
    OnboardingMotionSecondView()
}
