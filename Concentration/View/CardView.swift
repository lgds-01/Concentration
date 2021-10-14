//
//  CardView.swift
//  Concentration
//
//  Created by 乐观的神 on 2021/10/11.
//

import SwiftUI

struct CardView: View {
    var card: Card

    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 15)
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3, antialiased: true)
                    Text(card.text)
                        .font(.system(size: geometry.size.width * 0.65))
                } else {
                    shape.fill()
                        .opacity(card.isMatched ? 0 : 1)
                        .transition(.opacity)
                }
            }
            .rotation3DEffect(Angle(degrees: card.isFaceUp ? 180 : 0), axis: (x: 0, y: 1, z: 0))
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var card = Card(id: 1, text: "🐶")
    static var previews: some View {
        CardView(card: card)
    }
}
