//
//  NavigationManager.swift
//  kkeokkEulTime
//
//  Created by 남유성 on 6/15/24.
//

import SwiftUI

enum PathType: Hashable {
    case onboardingMain
    case onboardingMotionFirst
    case onboardingMotionSecond
    case onboardingMove
    case onboardingFinish
    
    case actionSelection
    case actionDetail(actionModel: ActionModel)
    case actionTryVideo(actionModel: ActionModel)
    case actionTryReady(actionModel: ActionModel)
    case actionTryCountDown(actionModel: ActionModel)
    case actionTry(actionModel: ActionModel)
    case actionTryGift(actionModel: ActionModel)
    case actionConnection(actionModel: ActionModel)
}

extension PathType {
    @ViewBuilder
    func NavigatingView() -> some View {
        switch self {
        case .onboardingMain:
            OnboardingMainView()
        case .onboardingMotionFirst:
            OnboardingMotionFirstView()
        case .onboardingMotionSecond:
            OnboardingMotionSecondView()
        case .onboardingMove:
            OnboardingMoveView()
        case .onboardingFinish:
            OnboardingFinishView()
        case .actionSelection:
            ActionSelectionView()
        case .actionDetail(let actionModel):
            ActionDetailView(action: actionModel)
        case .actionTryVideo(let actionModel):
            ActionTryVideoView(action: actionModel)
        case .actionTryReady(let actionModel):
            ActionTryReadyView(action: actionModel)
        case .actionTryCountDown(let actionModel):
            ActionTryCountDownView(action: actionModel)
        case .actionTry(let actionModel):
            ActionTryView(action: actionModel)
        case .actionTryGift(let actionModel):
            ActionTryGiftView(action: actionModel)
        case .actionConnection(let actionModel):
            ActionConnectionView(action: actionModel)
        }
    }
}

@Observable
class NavigationManager {
    static let shared = NavigationManager()
    private init() {}
    
    var path: [PathType] = []
}

extension NavigationManager {
    func push(to pathType: PathType) {
        path.append(pathType)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeAll()
    }
    
    func pop(to pathType: PathType) {
        guard let lastIndex = path.lastIndex(of: pathType) else { return }
        path.removeLast(path.count - (lastIndex + 1))
    }
    
    func pushNewAction(to pathType: PathType) {
        guard let lastIndex = path.lastIndex(of: .actionSelection) else { return }
        path.removeLast(path.count - (lastIndex + 1))
        
        path.append(pathType)
    }
}
