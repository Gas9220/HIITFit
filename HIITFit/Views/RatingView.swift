//
//  RatingView.swift
//  HIITFit
//
//  Created by Gaspare Monte on 06/12/23.
//

import SwiftUI

struct RatingView: View {
    let exerciseIndex: Int

    @AppStorage("ratings") private var ratings = "4000"

    @State private var rating  = 0

    let maximumRating = 5
    let onColor = Color.red
    let offColor = Color.gray

    var body: some View {
        HStack {
            ForEach(1 ..< maximumRating + 1, id: \.self) { index in
                Image(systemName: "waveform.path.ecg")
                    .foregroundStyle(index > rating ? offColor : onColor)
                    .onTapGesture {
                        updateRating(index: index)
                    }
                    .onAppear {
                        let index = ratings.index(ratings.startIndex, offsetBy: exerciseIndex)
                        let character = ratings[index]
                        rating = character.wholeNumberValue ?? 0
                    }
            }
        }
        .font(.largeTitle)
    }

    func updateRating(index: Int) {
        rating = index

        let index = ratings.index(ratings.startIndex, offsetBy: exerciseIndex)
        ratings.replaceSubrange(index...index, with: String(rating))
    }
}

#Preview {
    @AppStorage("ratings") var ratings: String?
    ratings = nil

    return RatingView(exerciseIndex: 0)
        .previewLayout(.sizeThatFits)
}
