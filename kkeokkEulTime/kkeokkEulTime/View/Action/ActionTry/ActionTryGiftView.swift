//
//  MotionPracticeFinishView.swift
//  kkeokkEulTime
//
//  Created by 남유성 on 6/15/24.
//

import SwiftUI

struct ActionTryGiftView: View {
    let action: ActionModel
    
    var body: some View {
        ZStack {
            Color(hex: "323232").ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer()
                
                Text("성공!")
                    .font(.custom(Pretendard.semiBold.rawValue, size: 22))
                    .foregroundStyle(Color(hex: "3FFBA1"))
                    .padding(.bottom, 14)
                
                Text("\(action.selectionTitle) | \(action.actionCount)회")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.white)
                    .overlay {
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 187, height: 32)
                            .foregroundStyle(.white.opacity(0.12))
                    }
                
                Spacer()
                
                Image(action.giftImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                
                Spacer()
                
                VStack {
                    Text(action.giftTitle[0])
                        .foregroundStyle(.white)
                    Text(action.giftTitle[1])
                        .foregroundStyle(Color(hex: "3FFBA1"))
                }
                .font(.custom(Pretendard.extraBold.rawValue, size: 48))
                .padding(.bottom, 18)
                
                Text(action.giftSetenceLong)
                    .font(.custom(Pretendard.regular.rawValue, size: 18))
                    .foregroundColor(.white)
                    .padding(.bottom)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button {
                    NavigationManager.shared.push(to: .actionConnection(actionModel: action.nextAction))
                } label: {
                    HStack {
                        Spacer()
                        Text("다음으로")
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
    ActionTryGiftView(action: ActionModel.details.first!)
}
