//
//  ContentView.swift
//  Concentration
//
//  Created by 乐观的神 on 2021/10/11.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel = GameViewModel()
    var body: some View {
        VStack {
            HeaderView(grade: viewModel.grade, restart: viewModel.restart)
            GeometryReader { geometry in
                LazyVGrid(columns: [GridItem(.adaptive(minimum: viewModel.idealWidth(itemCount: viewModel.cards.count, in: geometry.size, itemAspectRatio: 3/4)), spacing: 0)]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .animation(.easeInOut(duration: 0.45))
                            .aspectRatio(3/4, contentMode: .fit)
                            .foregroundColor(Color.init(.sRGB, red: 255/255, green: 165/255, blue: 0/255, opacity: 0.8))
                            .padding(15)
                            .shadow(color: .gray, radius: 6, x: 1, y: 1)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
        }
        .background(Color.init(.sRGB, red: 230/255, green: 230/255, blue: 250/255, opacity: 1))
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $viewModel.isWin, onDismiss: { viewModel.restart() }) { WinView(grade: viewModel.grade) }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
