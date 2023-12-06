//
//  HeaderView.swift
//  HIITFit
//
//  Created by Gaspare Monte on 06/12/23.
//

import SwiftUI

struct HeaderView: View {
    let titleText: String

    var body: some View {
        VStack {
            Text(titleText)
                .font(.largeTitle)

            HStack {
                Image(systemName: "hand.wave")
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
    HeaderView(titleText: "Squat")
        .previewLayout(.sizeThatFits)
}
