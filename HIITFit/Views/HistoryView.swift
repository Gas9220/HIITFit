//
//  HistoryView.swift
//  HIITFit
//
//  Created by Gaspare Monte on 06/12/23.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var history: HistoryStore
    @Binding var showHistory: Bool

    @State private var addMode = false

    var headerView: some View {
        HStack {
            Button {
                addMode = true
            } label: {
                Image(systemName: "plus")
            }
            .padding(.trailing)
            
            EditButton()

            Spacer()
            Text("History")
                .font(.title)
            Spacer()
            Button {
                showHistory.toggle()
            } label: {
                Image(systemName: "xmark.circle")
            }
            .font(.title)
        }
    }

    func dayView(day: ExerciseDay) -> some View {
        DisclosureGroup {
            exerciseView(day: day)
        } label: {
            Text(day.date.formatted(as: "d MMM YYYY"))
                .font(.headline)
        }
    }

    func exerciseView(day: ExerciseDay) -> some View {
        ForEach(day.uniqueExercises, id: \.self) { exercise in
            Text(exercise)
                .badge(day.countExercise(exercise: exercise))
        }
    }

    var body: some View {
        VStack {
            headerView
                .padding()
            List($history.exerciseDays, editActions: [.delete]) { $day in
                dayView(day: day)
                    .deleteDisabled(true)
            }
        }
        .onDisappear {
            try? history.save()
        }
    }
}

#Preview {
    HistoryView(showHistory: .constant(true))
        .environmentObject(HistoryStore())
}
