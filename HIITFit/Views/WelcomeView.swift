//
//  WelcomeView.swift
//  HIITFit
//
//  Created by Gaspare Monte on 05/12/23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            VStack {
                HeaderView(titleText: "Welcome")
                    .padding(.bottom)

                Spacer()

                Button("History") {

                }
                .padding(.bottom)
            }

            VStack {
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text("Get fit")
                            .font(.largeTitle)
                        Text("with high intensity interval training")
                            .font(.headline)
                    }

                    Image("step-up")
                        .resizedToFill(width: 240, height: 240)
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
