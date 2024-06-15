//
//  OnboardingFinishView.swift
//  kkeokkEulTime
//
//  Created by 남유성 on 6/15/24.
//

import SwiftUI

struct OnboardingFinishView: View {
    @Bindable private var motionManager = MotionManager.shared
    
    var body: some View {
        ZStack {
            Color(hex: "323232").ignoresSafeArea()
            
            VStack(spacing: 12) {
                VStack(spacing: 0) {
                    Text("잘했어요!")
                    Image("line")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 16)
                }
                .font(.custom(Pretendard.semiBold.rawValue, size: 24))
                .padding(.top, 44)
    
                Spacer()
                
                Image("character")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 319)
                
                Spacer()
                Spacer()
                
                VStack(spacing: 6) {
                    Text("그럼 이제")
                        .font(.custom(Pretendard.regular.rawValue, size: 20))
                    HStack {
                        Text("손목 스트레칭")
                            .foregroundStyle(Color(hex: "3FFBA1"))
                        Text("시작해볼까요?")
                    }
                    .font(.custom(Pretendard.bold.rawValue, size: 22))
                }
                .padding(.bottom, 28)
                
                Button {
                    NavigationManager.shared.push(to: .actionSelection)
                } label: {
                    HStack {
                        Spacer()
                        Text("손목 꺾으러 가기")
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
                NavigationManager.shared.push(to: .actionSelection)
            }
        }
    }
}

#Preview {
    OnboardingFinishView()
}
