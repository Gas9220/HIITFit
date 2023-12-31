//
//  RaisedButton.swift
//  HIITFit
//
//  Created by Gaspare Monte on 07/12/23.
//

import SwiftUI

struct RaisedButton: View {
    let buttonText: String
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Text(buttonText)
                .raisedButtonTextStyle()
        }
        .buttonStyle(.raised)
    }
}

#Preview {
    ZStack {
        RaisedButton(buttonText: "Get Started") {
            print("Hello World!")
        }
        .padding(20)
        .buttonStyle(.raised)
    }
    .background(Color("background"))
    .previewLayout(.sizeThatFits)
}

struct RaisedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding([.top, .bottom], 12)
            .background(
                Capsule()
                    .foregroundStyle(Color("background"))
                    .shadow(color: Color("drop-shadow"), radius: 4, x: 6, y: 6)
                    .shadow(color: Color("drop-highlight"), radius: 4, x: -6, y: -6)
            )
    }
}

extension ButtonStyle where Self == RaisedButtonStyle {
    static var raised: RaisedButtonStyle {
        .init()
    }
}

extension Text {
    func raisedButtonTextStyle() -> some View {
        self
            .font(.body)
            .fontWeight(.bold)
    }
}
