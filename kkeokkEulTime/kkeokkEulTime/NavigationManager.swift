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
}
