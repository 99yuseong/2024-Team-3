//
//  SoundManager.swift
//  kkeokkEulTime
//
//  Created by 남유성 on 6/15/24.
//

import SwiftUI
import AVKit

@Observable
class SoundManager {
    static let shared = SoundManager()
    private init() {}
    
    var player: AVAudioPlayer?
    
    // TODO: - 음악에 맞게 수정
    enum soundOption {
        case ding
        
        var filename: String {
            switch self {
            case .ding:
                "Ding-sound-effect"
            }
        }
    }
    
    func playSound(sounds: soundOption) {
        guard let url = Bundle.main.url(forResource: sounds.filename, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("재생하는데 오류가 생겼습니다. 오류코드 \(error.localizedDescription)")
        }
    }
    
}
