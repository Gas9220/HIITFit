//
//  HistoryStore.swift
//  HIITFit
//
//  Created by Gaspare Monte on 06/12/23.
//

import Foundation

struct ExerciseDay: Identifiable {
    let id = UUID()
    let date: Date
    var exercises: [String] = []
}

class HistoryStore: ObservableObject {
    @Published var exerciseDays: [ExerciseDay] = []

    init() {
        #if DEBUG
        //createDevData()
        #endif
    }

    func addDoneExercise(_ exerciseName: String) {
        let today = Date()

        if let firstDate = exerciseDays.first?.date, today.isSameDay(as: firstDate) {
            exerciseDays[0].exercises.append(exerciseName)
        } else {
            exerciseDays.insert(ExerciseDay(date: today, exercises: [exerciseName]), at: 0)
        }
    }
}
