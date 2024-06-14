//
//  MotionPracticeFinishView.swift
//  kkeokkEulTime
//
//  Created by 남유성 on 6/15/24.
//

import SwiftUI

struct MotionPracticeFinishView: View {
    let action: ActionModel
    
    var body: some View {
        ZStack {
            Color(hex: "323232").ignoresSafeArea()
            
            VStack(spacing: 0) {
                Text("성공!")
                    .font(.custom(Pretendard.semiBold.rawValue, size: 22))
                    .foregroundStyle(Color(hex: "3FFBA1"))
                    .padding(.bottom, 14)
                
                Image(action.giftImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                
                VStack {
                    Text(action.giftTitle[0])
                    Text(action.giftTitle[1])
                }
                
                
                Text(action.readySentence)
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.bottom)
            }
        }
    }
}

#Preview {
    MotionPracticeFinishView(action: ActionModel.details.first!)
}
