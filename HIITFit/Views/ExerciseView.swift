//
//  ExerciseView.swift
//  HIITFit
//
//  Created by Gaspare Monte on 05/12/23.
//

import SwiftUI

struct ExerciseView: View {
    let index: Int

    var exercises: Exercise {
        Exercise.exercises[index]
    }

    var body: some View {
        VStack {
            HeaderView(exerciseName: exercises.exerciseName)

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
