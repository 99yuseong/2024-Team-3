//
//  ContentView.swift
//  kkeokkEulTime
//
//  Created by 남유성 on 6/14/24.
//

import SwiftUI
import Charts

struct ContentView: View {
    @State private var motionManager = MotionManager.shared
    @State private var soundManager = SoundManager.shared
    @State private var hapticManager = HapticManager.shared
    
    var body: some View {
        VStack {
            ZStack {
                ChartFor(motionManager.rollData, label: "roll", color: .red)
                ChartFor(motionManager.yawData, label: "yaw", color: .green)
                ChartFor(motionManager.pitchData, label: "pitch", color: .blue)
                
                Group {
                    motionManager.isShacking ? Color.red : Color.clear
                }
                .ignoresSafeArea()
            }
            .chartXScale(domain: 0...motionManager.dataCounts * 2)
            .chartYScale(domain: -Double.pi...Double.pi)
            .animation(.easeInOut(duration: 0.2), value: motionManager.isShacking)
            .onChange(of: motionManager.isShacking) {
                if motionManager.isShacking {
                    hapticManager.impact(style: .heavy)
                }
            }
            .onAppear {
                motionManager.startUpdates()
            }
            .onDisappear {
                motionManager.stopUpdates()
            }
        }
    }
}

extension ContentView {
    @ViewBuilder
    func ChartFor(_ data: [Double], label: String, color: Color) -> some View {
        Chart {
            ForEach(Array(data.enumerated()), id: \.offset) { index, value in
                LineMark(
                    x: .value("Time", index),
                    y: .value("Roll", value)
                )
                .foregroundStyle(color)
                
                if (index + 1) % 25 == 0 {
//                if index + 1 == data.count {
                    PointMark(
                        x: .value("Time", index),
                        y: .value("Roll", value)
                    )
                    .foregroundStyle(color)
                    .annotation(position: .trailing) {
                        Text(label + String(format: "%.2f", value))
                            .font(.caption)
                            .foregroundColor(color)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
