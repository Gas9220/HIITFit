//
//  ExerciseView.swift
//  HIITFit
//
//  Created by Gaspare Monte on 05/12/23.
//

import SwiftUI

struct ExerciseView: View {
    @EnvironmentObject var history: HistoryStore

    @Binding var selectedTab: Int

    @State private var showHistory = false
    @State private var showSuccess = false
    @State private var timerDone = false
    @State private var showTimer = false

    let index: Int

    var exercise: Exercise {
        Exercise.exercises[index]
    }

    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }

    var body: some View {
        GeometryReader { geometry in

            VStack(spacing: 0) {

                HeaderView(selectedTab: $selectedTab, titleText: exercise.exerciseName)
                    .padding(.bottom)

                ContainerView {
                    VStack {
                        VideoPlayerView(videoName: exercise.videoName)
                            .frame(height: geometry.size.height * 0.35)
                            .padding(20)

                        HStack(spacing: 150) {
                            startButton
                            doneButton
                                .disabled(!timerDone)
                                .sheet(isPresented: $showSuccess) {
                                    SuccessView(selectedTab: $selectedTab)
                                        .presentationDetents([.medium, .large])
                                }
                        }
                        .font(.title3)
                        .padding()

                        if showTimer {
                            TimerView(timerDone: $timerDone, size: geometry.size.height * 0.07)
                        }

                        Spacer()

                        RatingView(exerciseIndex: index)
                            .padding()

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
        }
    }

    var startButton: some View {
        RaisedButton(buttonText: "Start Exercise") {
            showTimer.toggle()
        }
    }

    var doneButton: some View {
        Button("Done") {
            history.addDoneExercise(Exercise.exercises[index].exerciseName)

            withAnimation {
                if lastExercise {
                    showSuccess.toggle()
                } else {
                    selectedTab += 1
                }

                timerDone = false
                showTimer.toggle()
            }
        }
    }
}

#Preview {
    ExerciseView(selectedTab: .constant(0), index: 0)
        .environmentObject(HistoryStore())
}
