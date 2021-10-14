//
//  CardViewModel.swift
//  Concentration
//
//  Created by 乐观的神 on 2021/10/11.
//

import SwiftUI

class GameViewModel: ObservableObject {
    private static let emojis = ["🚗", "✈️", "🛵", "🚢", "🥌", "🏀", "🚒", "🛻", "🚜", "🐶", "🐸", "🐯", "🦊", "⛸", "🏐", "🚍", "🚁", "🧲", "🧯", "🏍", "🎰", "🦅", "🐍", "🐙", "🐄"]

    static var difficulty: Int {
        UserDefaults.standard.integer(forKey: "difficulty")
    }

    static let difficulties = [4,9,12,16,25]

    @Published var model = Model(numberOfCardPair: difficulty, emojis: emojis)
    @Published var grade = 0
    @Published var isWin = false

    func restart() {
        grade = 0
        isWin = false
        model.restart()
    }

    var cards: [Card] {
        model.cards
    }

    func choose(_ card: Card) {
        if model.choose(card) {
            grade += 10
            if judgeWin() {
                isWin.toggle()
            }
        } else {
            grade -= 1
        }
    }

    func judgeWin() -> Bool {
        for card in cards {
            if !card.isMatched {
                return false
            }
        }
        return true
    }

    func idealWidth(itemCount: Int, in size: CGSize, itemAspectRatio: CGFloat) -> CGFloat {
        var columnCount = 1
        var rowCount = itemCount

        repeat {
            let itemWidth = size.width / CGFloat(columnCount)
            let itemHeight = itemWidth / itemAspectRatio

            if CGFloat(rowCount) * itemHeight < size.height {
                break
            }

            columnCount += 1
            rowCount = (itemCount + (columnCount - 1)) / columnCount
        } while itemCount > columnCount

        if columnCount > itemCount {
            columnCount = itemCount
        }

        return floor(size.width / CGFloat(columnCount))
    }
}
