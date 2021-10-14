//
//  Card.swift
//  Concentration
//
//  Created by 乐观的神 on 2021/10/11.
//

import Foundation
import SwiftUI

struct Model {
    private(set) var cards = [Card]()

    var indexOfTheOnlyOneFaceUp: Int? {
        set {
            cards.indices.forEach {cards[$0].isFaceUp = (newValue == $0)}
        }
        get {
            let idxs = cards.indices.filter({cards[$0].isFaceUp})
            if idxs.count > 1 { return nil }
            else { return idxs.first }
        }
    }

    init(numberOfCardPair: Int, emojis: [String]) {
        for index in 0..<numberOfCardPair {
            cards.append(Card(id: index * 2, text: emojis[index]))
            cards.append(Card(id: index * 2 + 1, text: emojis[index]))
        }
        cards = cards.shuffled()
    }
    mutating func choose(_ card: Card) -> Bool {
        var flag = false
        if let index = cards.firstIndex(where: {$0.id == card.id}),
           !cards[index].isFaceUp,
           !cards[index].isMatched{
            if let onlyOne = indexOfTheOnlyOneFaceUp {
                if cards[onlyOne].text == cards[index].text {
                    cards[onlyOne].isMatched.toggle()
                    cards[index].isMatched.toggle()
                    flag = true
                }
                cards[index].isFaceUp.toggle()
            } else {
                indexOfTheOnlyOneFaceUp = index
            }
        }
        return flag
    }

    mutating func restart() {
        for index in cards.indices {
            cards[index].isMatched = false
            cards[index].isFaceUp = false
        }
        cards = cards.shuffled()
    }

    mutating func add(emoji: String) {
        cards.append(Card(id: cards.count, text: emoji))
        cards.append(Card(id: cards.count + 1, text: emoji))
    }
}
struct Card: Identifiable {
    var id: Int
    var text: String
    var isMatched = false
    var isFaceUp = false
}
