//
//  HeaderView.swift
//  HIITFit
//
//  Created by Gaspare Monte on 06/12/23.
//

import SwiftUI

struct HeaderView: View {
    let exerciseName: String

    var body: some View {
        VStack {
            Text(exerciseName)
                .font(.largeTitle)

            HStack {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
                Image(systemName: "4.circle")
            }
            .font(.title2)
        }
    }
}

#Preview {
    HeaderView(exerciseName: "Squat")
        .previewLayout(.sizeThatFits)
}
