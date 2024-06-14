//
//  OnboardingMainView.swift
//  kkeokkEulTime
//
//  Created by 남유성 on 6/15/24.
//

import SwiftUI

struct OnboardingMainView: View {
    var body: some View {
        ZStack {
            Color(hex: "323232").ignoresSafeArea()
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("지금은")
                            .font(.custom(Pretendard.semiBold.rawValue, size: 24))
                            .foregroundStyle(Color(hex: "E1E2D7"))
                            .padding(.bottom, -16)
                        
                        Text("손목")
                            .font(.custom(Pretendard.extraBold.rawValue, size: 60))
                            .foregroundStyle(.white)
                        
                        Text("꺾을 시간")
                            .font(.custom(Pretendard.extraBold.rawValue, size: 60))
                            .foregroundStyle(Color(hex: "3FFBA1"))
                    }
                    
                    Spacer()
                }
                .padding(.top, 44)
                .padding(.horizontal, 28)
                
                Spacer()
                
                VStack(spacing: 10) {
                    VStack {
                        Text("Work & Life Collaboration을 위한")
                        Text("손목 건강")
                    }
                    .font(.custom(Pretendard.light.rawValue, size: 16))
                    .foregroundStyle(Color(hex: "BEBFBA"))
                    
                    HStack(spacing: 4) {
                        Text("꺾을 시간")
                            .font(.custom(Pretendard.bold.rawValue, size: 24))
                            .foregroundStyle(Color(hex: "3FFBA1"))
                        Text("과 함께 시작해보세요")
                            .font(.custom(Pretendard.regular.rawValue, size: 20))
                            .foregroundStyle(Color(hex: "F4F6E9"))
                    }
                    .padding(.bottom, 32)
                }
                
                Button {
                    NavigationManager.shared.push(to: .onboardingMotionFirst)
                } label: {
                    HStack {
                        Spacer()
                        Text("시작하기")
                            .font(.system(size: 20))
                            .bold()
                            .tint(.white)
                        Spacer()
                    }
                    .padding(.vertical, 16)
                }
                .background(Color(hex: "03C367"))
            }
        }
    }
}

#Preview {
    OnboardingMainView()
}
