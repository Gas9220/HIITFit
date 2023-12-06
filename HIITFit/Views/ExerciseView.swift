//
//  ExerciseView.swift
//  HIITFit
//
//  Created by Gaspare Monte on 05/12/23.
//

import SwiftUI

struct ExerciseView: View {
    let videoNames = ["squat", "step-up", "burpee", "sun-salute"]
    let exerciseNames = ["Squat", "Step Up", "Burpee", "Sun Salute"]

    let index: Int

    var body: some View {
        VStack {
            HeaderView(exerciseName: exerciseNames[index])

            Text("Video player")
            Text("Time")
            Text("Start/done Button")
            Text("Rating")
            Text("History button")
        }
    }
}

#Preview {
    ExerciseView(index: 0)
}
