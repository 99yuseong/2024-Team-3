//
//  ActionConnectionView.swift
//  kkeokkEulTime
//
//  Created by 남유성 on 6/15/24.
//

import SwiftUI
import Combine

struct ActionConnectionView: View {
    @State private var count = 5
    @State private var cancellable: AnyCancellable? = nil
    
    let action: ActionModel
    
    var body: some View {
        ZStack {
            Image(action.readyImage)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .blur(radius: 12)
                .opacity(0.9)
                .background(Color(hex: "3232323"))
            
            
            VStack(spacing: 32) {
                Text("\(count)초 후 재생")
                    .font(.system(size: 18, weight: .regular))
                    .foregroundColor(.white)
                    .overlay {
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 187, height: 37)
                            .foregroundStyle(.white.opacity(0.12))
                    }
                
                VStack(spacing: 0) {
                    Image(action.originalImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 280, height: 225)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .background(.black)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text(action.selectionTitle)
                            .font(.custom(Pretendard.bold.rawValue, size: 22))
                        
                        VStack(spacing: 8) {
                            HStack(spacing: 6) {
                                Image(systemName: "checkmark.shield")
                                Text("\(action.actionCount)회")
                                Spacer()
                            }
                            
                            HStack(alignment: .top, spacing: 6) {
                                Image(systemName: "gift")
                                Text(action.giftSetenceShort)
                                Spacer()
                            }
                        }
                        .font(.custom(Pretendard.regular.rawValue, size: 17))
                        .foregroundStyle(Color(hex: "F4F6E9"))
                    }
                    .padding()
                    .background(.black)
                    .frame(width: 280)
                    .foregroundStyle(.white)
                    .background(.black)
                }
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            
            VStack {
                Spacer()
                Button {
                    NavigationManager.shared.pushNewAction(to: .actionTryVideo(actionModel: action))
                    cancellable?.cancel()
                } label: {
                    Image("SkipButton")
                }
            }
            .padding(.bottom, 40)
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
        .onAppear {
            cancellable?.cancel()
            let timerPublisher = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
            
            cancellable = timerPublisher
                        .scan(5) { counter, _ in
                            counter - 1
                        }
                        .sink { count in
                            self.count = count
                            
                            if count == 1 {
                                self.cancellable?.cancel()
                                NavigationManager.shared.pushNewAction(to: .actionTryVideo(actionModel: action))
                            }
                        }
        }
    }
}

#Preview {
    NavigationStack {
        ActionConnectionView(action: ActionModel.details.first!)
    }
}
