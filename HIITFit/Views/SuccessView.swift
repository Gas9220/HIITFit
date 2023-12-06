//
//  SuccessView.swift
//  HIITFit
//
//  Created by Gaspare Monte on 06/12/23.
//

import SwiftUI

struct SuccessView: View {
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "hand.raised.fill")
                    .resizedToFill(width: 75, height: 75)
                    .foregroundStyle(.purple)

                Text("High Five!")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("""
                    Good job completing all four exercises!
                    Remember tomorrow's another day.
                    So eat well and get some rest
                    """)
                .multilineTextAlignment(.center)
                .foregroundStyle(.gray)

            }

            VStack {
                Spacer()

                Button("Continue") {

                }
                .padding()
            }
        }
    }
}

#Preview {
    SuccessView()
}
