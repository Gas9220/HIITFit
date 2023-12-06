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

struct HistoryStore {
    var exerciseDays: [ExerciseDay] = []

    init() {
        #if DEBUG
        createDevData()
        #endif
    }
}
