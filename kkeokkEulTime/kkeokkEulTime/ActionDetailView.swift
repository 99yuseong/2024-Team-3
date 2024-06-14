//
//  ActionDetailView.swift
//  kkeokkEulTime
//
//  Created by 남유성 on 6/15/24.
//

import SwiftUI

struct ActionDetailView: View {
    let action: ActionModel
    
    var body: some View {
        VStack(spacing: 14) {
            ZStack(alignment: .bottom) {
                Image(action.filledImage)
                    .resizable()
                    .frame(height: 525)
                    .scaledToFill()
                
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(hex: "323232"),
                        Color(hex: "323232").opacity(0)
                    ]),
                    startPoint: .bottom, endPoint: .top
                )
                .frame(height: 365)
                
                HStack {
                    Text(action.title)
                        .font(.system(size: 34, weight: .black)).foregroundColor(.white)
                        .padding(.leading, 20)
                        .padding(.bottom, 24)
                    Spacer()
                }
            }
            
            VStack(spacing: 16) {
                VStack(spacing: 8) {
                    HStack {
                        Image(systemName: "checkmark.shield")
                        Text("\(action.count)회")
                        Spacer()
                    }
                    .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "gift")
                        Text(action.gift)
                        Spacer()
                    }
                    .fontWeight(.bold)
                }
                
                VStack {
                    Text("손목 터널 증후군이 없는 카리나처럼...증후군 자가진단 해보기손목 터널 증후군이 없는 카리나처럼... 증후군 자가진단 해보기손목 터널 증후군이 없는 카리나처럼... 증후군 자가진단 해보기")
                        .font(.system(size: 16))
                    
                    Spacer()
                    
                    Button {
                        // TODO: - 동영상 재생
                    } label: {
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .frame(width: 88, height: 88)
                            .foregroundColor(Color(hex: "04D470"))
                            .background(.white)
                            .clipShape(Circle())
                    }
                }
            }
            .foregroundStyle(.white)
            .padding(.horizontal, 20)
        }
        .ignoresSafeArea()
        .background(Color(hex: "323232"))
    }
}

#Preview {
    ActionDetailView(action: ActionModel.details.first!)
}

