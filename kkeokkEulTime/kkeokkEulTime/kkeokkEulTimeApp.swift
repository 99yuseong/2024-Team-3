//
//  kkeokkEulTimeApp.swift
//  kkeokkEulTime
//
//  Created by 남유성 on 6/14/24.
//

import SwiftUI

@main
struct kkeokkEulTimeApp: App {    
    @State private var navigationManager = NavigationManager.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationManager.path) {
                ActionSelectionView()
                    .navigationDestination(for: PathType.self) { path in
                        path.NavigatingView()
                            .navigationBarBackButtonHidden()
                    }
            }
            .preferredColorScheme(.dark)
        }
    }
}
