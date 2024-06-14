//
//  MotionManager.swift
//  kkeokkEulTime
//
//  Created by 남유성 on 6/14/24.
//

import Foundation
import CoreMotion

enum WristMotion {
    case rolled
    case none
    case unFolded
}

@Observable
class MotionManager {
    static let shared = MotionManager()
    private init() {
        _motionManager.deviceMotionUpdateInterval = 0.1
        _motionManager.showsDeviceMovementDisplay = true
    }
    
    var rollData: [Double] = []
    var pitchData: [Double] = []
    var yawData: [Double] = []
    
    var isShacking: Bool = false
    var isNextLevel: Bool = false
    var isGetOut: Bool = false
    var isWoiWoi: WristMotion = .none
    var isCutter: WristMotion = .none
    
    @ObservationIgnored var dataCounts: Int { _dataCounts }
    @ObservationIgnored private let _dataCounts: Int = 100
    @ObservationIgnored private let _motionManager = CMMotionManager()
}

extension MotionManager {
    func startUpdates() {
        if _motionManager.isDeviceMotionAvailable {
            _motionManager.startDeviceMotionUpdates(to: .main) { [weak self] (motion, error) in
                guard let self = self, let motion = motion else { return }
                
                let roll = motion.attitude.roll
                let pitch = motion.attitude.pitch
                let yaw = motion.attitude.yaw
                
                let accelerationMagnitude = sqrt(motion.userAcceleration.x.square() + motion.userAcceleration.y.square() + motion.userAcceleration.z.square())
                
                self.rollData.append(roll)
                self.pitchData.append(pitch)
                self.yawData.append(yaw)
                
                // MARK: - 1. 워이워이
                switch roll {
                case 1.5...2.0:
                    self.isWoiWoi = .unFolded
                case (-2.3)...(-2.0):
                    self.isWoiWoi = .rolled
                default:
                    self.isWoiWoi = .none
                }
                
                // MARK: - 2. 썰어버려
                switch pitch {
                case 0.25...0.35:
                    self.isCutter = .unFolded
                case 1.2...1.35:
                    self.isCutter = .rolled
                default:
                    self.isCutter = .none
                }
                
                // MARK: - 3. 나가주세요
                self.isGetOut = pitch < -0.6
                
                // MARK: - 4. 노려보자 카리나
                self.isNextLevel = abs(abs(pitch) - abs(roll)) < 0.1
                
                // MARK: - 5. 털어
                self.isShacking = accelerationMagnitude > 1
                
                if self.rollData.count > _dataCounts {
                    self.rollData.removeFirst()
                    self.pitchData.removeFirst()
                    self.yawData.removeFirst()
                }
            }
        }
    }
    
    func stopUpdates() {
        _motionManager.stopDeviceMotionUpdates()
    }
}
