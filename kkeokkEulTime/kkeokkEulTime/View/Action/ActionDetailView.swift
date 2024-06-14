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
                Image(action.originalImage)
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
                    Text(action.selectionTitle)
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
                        Text("\(action.actionCount)회")
                        Spacer()
                    }
                    .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "gift")
                        Text(action.giftSetenceShort)
                        Spacer()
                    }
                    .fontWeight(.bold)
                }
                
                VStack {
                    Text(action.selectionDescription)
                        .font(.system(size: 16))
                    
                    Spacer()
                    
                    Button {
                        NavigationManager.shared.push(to: .actionTutorial(actionModel: action))
                    } label: {
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .frame(width: 88, height: 88)
                            .foregroundColor(Color(hex: "04D470"))
                            .background(.white)
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                }
            }
            .foregroundStyle(.white)
            .padding(.horizontal, 20)
        }
        .ignoresSafeArea()
        .background(Color(hex: "323232"))
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    NavigationManager.shared.pop()
                } label: {
                    Image(systemName: "chevron.left")
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
    ActionDetailView(action: ActionModel.details.first!)
}

