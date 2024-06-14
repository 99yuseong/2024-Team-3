//
//  OnboardingMoveView.swift
//  kkeokkEulTime
//
//  Created by 남유성 on 6/15/24.
//

import SwiftUI

struct OnboardingMoveView: View {
    @Bindable private var motionManager = MotionManager.shared
    @State private var moveCount: Int = 3
    
    var body: some View {
        ZStack {
            Color(hex: "323232").ignoresSafeArea()
            
            VStack(spacing: 12) {
                VStack {
                    HStack {
                        Text("아이폰을")
                        Text("좌우로 3번")
                            .foregroundStyle(Color(hex: "3FFBA1"))
                    }
                    Text("움직여주세요")
                }
                .font(.custom(Pretendard.semiBold.rawValue, size: 24))
                .padding(.top, 44)
    
                Spacer()
                
                Image("move")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .padding(.bottom, 38)
                
                Text("\(moveCount)")
                    .font(.custom(Pretendard.semiBold.rawValue, size: 60))
                
                Spacer()
                
                Button {
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
        .onChange(of: motionManager.isShacking) {
            if motionManager.isShacking {
                HapticManager.shared.impact(style: .medium)
                moveCount -= 1
            }
        }
        .onChange(of: moveCount) {
            if moveCount == 0 {
                NavigationManager.shared.push(to: .onboardingFinish)
            }
        }
        .onAppear {
            motionManager.startUpdates()
        }
        .onDisappear {
            motionManager.stopUpdates()
        }
    }
}

#Preview {
    OnboardingMoveView()
}
