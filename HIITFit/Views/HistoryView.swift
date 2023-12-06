//
//  HistoryView.swift
//  HIITFit
//
//  Created by Gaspare Monte on 06/12/23.
//

import SwiftUI

struct HistoryView: View {
    let today = Date()
    let yesterday = Date().addingTimeInterval(-86400)

    let exercises1 = ["Squat", "Step Up", "Burpee", "Sun Salute"]
    let exercises2 = ["Squat", "Step Up", "Burpee"]

    var body: some View {
        VStack {
            Text("History")
                .font(.title)
                .padding()

            Form {
                Section {
                    ForEach(exercises1, id: \.self) { exercise in
                        Text(exercise)
                    }
                } header: {
                    Text(today.formatted(as: "MMM d"))
                        .font(.headline)
                }

                Section {
                    ForEach(exercises2, id: \.self) { exercise in
                        Text(exercise)
                    }

                } header: {
                    Text(yesterday.formatted(as: "MMM d"))
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    HistoryView()
}
