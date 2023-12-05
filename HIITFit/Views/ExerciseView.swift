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
        Text(exerciseNames[index])
    }
}

#Preview {
    ExerciseView(index: 0)
}
