//
//  ExerciseView.swift
//  HIITFit
//
//  Created by Gaspare Monte on 05/12/23.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    let index: Int

    var exercise: Exercise {
        Exercise.exercises[index]
    }

    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(exerciseName: exercise.exerciseName)
                    .padding(.bottom)

                if let url = Bundle.main.url(forResource: exercise.videoName, withExtension: "mp4") {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: geometry.size.height * 0.45)
                } else {
                    Text("Couldn't find \(exercise.videoName).mp4")
                      .foregroundColor(.red)
                }
                Text("Time")
                Text("Start/done Button")
                Text("Rating")
                Text("History button")
            }
        }
    }
}

#Preview {
    ExerciseView(index: 0)
}
