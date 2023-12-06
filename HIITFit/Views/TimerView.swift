//
//  TimerView.swift
//  HIITFit
//
//  Created by Gaspare Monte on 06/12/23.
//

import SwiftUI

struct CountdownView: View {
    @Binding var timeRemaining: Int

    let date: Date
    let size: Double

    var body: some View {
        Text("\(timeRemaining)")
            .font(.system(size: size, design: .rounded))
            .padding()
            .onChange(of: date) {
                timeRemaining -= 1
            }
    }
}

struct TimerView: View {
    @State private var timeRemaining: Int = 3

    @Binding var timerDone: Bool

    let size: Double

    var body: some View {
        TimelineView(  //
            .animation(
                minimumInterval: 1.0,
                paused: timeRemaining <= 0)) { context in
                    CountdownView(
                        timeRemaining: $timeRemaining,
                        date: context.date,
                        size: size)
                }
                .onChange(of: timeRemaining) {
                    if timeRemaining < 1 {
                        timerDone = true
                    }
                }
    }
}

#Preview {
    TimerView(timerDone: .constant(false), size: 90)
}
