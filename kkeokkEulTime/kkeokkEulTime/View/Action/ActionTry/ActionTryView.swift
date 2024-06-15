//
//  MotionPracticeView.swift
//  kkeokkEulTime
//
//  Created by 남유성 on 6/15/24.
//

import SwiftUI

struct ActionTryView: View {
    @Bindable private var motionManager = MotionManager.shared
    @State private var count: Int
    
    let action: ActionModel
    
    init(action: ActionModel) {
        self.count = action.actionCount
        self.action = action
    }
    
    var body: some View {
        ZStack {
            Color(hex: "323232").ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer()
                
                Text("\(action.selectionTitle) | \(action.actionCount)회")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.white)
                    .overlay {
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 280, height: 32)
                            .foregroundStyle(.white.opacity(0.12))
                    }
                    .padding(.bottom, 53)
                
                HStack(spacing: 20) {
                    Group {
                        Image(action.practiceImages[0])
                            .resizable()
                            .scaledToFill()
                        Image(action.practiceImages[1])
                            .resizable()
                            .scaledToFill()
                    }
                    .frame(height: 210)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 40)
                
                ZStack {
                    Circle()
                        .trim(from: 0, to: CGFloat(Double(count) / Double(action.actionCount)))
                        .stroke(Color(hex: "3FFBA1"), lineWidth: 6)
                        .rotationEffect(.degrees(-90))
                        .frame(width: 106, height: 106)
                    
                    Text("\(count)")
                        .font(.custom(Pretendard.semiBold.rawValue, size: 60))
                        .foregroundStyle(.white)
                }
                
                Spacer()
                
                Text(action.readySentence)
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.bottom)
            }
        }
        .onChange(of: motionManager.isDetected(type: action.type)) {
            if motionManager.isDetected(type: action.type) {
                HapticManager.shared.impact(style: .medium)
                SoundManager.shared.playSound(sounds: .motionDoing)
                count -= 1
                
                if count == 0 {
                    SoundManager.shared.playSound(sounds: .motionDone)
                    NavigationManager.shared.push(to: .actionTryGift(actionModel: action))
                }
            }
        }
        .onAppear {
            motionManager.startUpdates()
        }
        .onDisappear {
            motionManager.stopUpdates()
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
    ActionTryView(action: ActionModel.details.first!)
}
