//
//  MotionManager.swift
//  kkeokkEulTime
//
//  Created by 남유성 on 6/14/24.
//

import Foundation
import CoreMotion

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
    
    @ObservationIgnored var dataCounts: Int { _dataCounts }
    @ObservationIgnored private let _dataCounts: Int = 100
    @ObservationIgnored private let _motionManager = CMMotionManager()
}

extension MotionManager {
    func startUpdates() {
        if _motionManager.isDeviceMotionAvailable {
            _motionManager.startDeviceMotionUpdates(to: .main) { [weak self] (motion, error) in
                guard let self = self, let motion = motion else { return }
                
                self.rollData.append(motion.attitude.roll)
                self.pitchData.append(motion.attitude.pitch)
                self.yawData.append(motion.attitude.yaw)
                
                let accelerationMagnitude = sqrt(motion.userAcceleration.x.square() + motion.userAcceleration.y.square() + motion.userAcceleration.z.square())
                self.isShacking = accelerationMagnitude > 1
                
                print(accelerationMagnitude)
                
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
