//
//  Double+.swift
//  kkeokkEulTime
//
//  Created by 남유성 on 6/14/24.
//

import Foundation

extension Double {
    func toPositive() -> Double {
        self + Double.pi * 2
    }
    
    func square() -> Double {
        self * self
    }
}
