//
//  ExerciseView.swift
//  HIITFit
//
//  Created by Gaspare Monte on 05/12/23.
//

import SwiftUI

struct ExerciseView: View {
    @Binding var selectedTab: Int

    @State private var rating = 0
    @State private var showHistory = false
    @State private var showSuccess = false

    let index: Int

    var exercise: Exercise {
        Exercise.exercises[index]
    }

    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }

    let interval: TimeInterval = 3

    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(selectedTab: $selectedTab, titleText: exercise.exerciseName)
                    .padding(.bottom)

                VideoPlayerView(videoName: exercise.videoName)
                    .frame(height: geometry.size.height * 0.45)

                Text(Date().addingTimeInterval(interval), style: .timer)
                    .font(.system(size: geometry.size.height * 0.07))

                HStack(spacing: 150) {
                    startButton
                    doneButton
                        .sheet(isPresented: $showSuccess) {
                            SuccessView(selectedTab: $selectedTab)
                                .presentationDetents([.medium, .large])
                        }
                }
                .font(.title3)
                .padding()

                RatingView(rating: $rating)
                    .padding()

                Spacer()

                Button("History") {
                    showHistory.toggle()
                }
                .padding(.bottom)
                .sheet(isPresented: $showHistory) {
                    HistoryView(showHistory: $showHistory)
                }
            }
        }
    }

    var startButton: some View {
        Button("Start Exercise") { }
    }

    var doneButton: some View {
        Button("Done") {
            withAnimation {
                if lastExercise {
                    showSuccess.toggle()
                } else {
                    selectedTab += 1
                }
            }
        }
    }
}

#Preview {
    ExerciseView(selectedTab: .constant(1), index: 3)
}
