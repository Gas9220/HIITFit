//
//  HistoryView.swift
//  HIITFit
//
//  Created by Gaspare Monte on 06/12/23.
//

import SwiftUI

struct HistoryView: View {
    @Binding var showHistory: Bool

    @EnvironmentObject var history: HistoryStore

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button {
                showHistory.toggle()
            } label: {
                Image(systemName: "xmark.circle")
            }
            .font(.title)
            .padding()

            VStack {
                Text("History")
                    .font(.title)
                    .padding()

                Form {
                  ForEach(history.exerciseDays) { day in
                      Section {
                          ForEach(day.exercises, id: \.self) { exercise in
                            Text(exercise)
                          }
                      } header: {
                          Text(day.date.formatted(as: "MMM d"))
                          .font(.headline)
                      }
                   }
                }
            }
        }
    }
}

#Preview {
    HistoryView(showHistory: .constant(true))
        .environmentObject(HistoryStore())
}
