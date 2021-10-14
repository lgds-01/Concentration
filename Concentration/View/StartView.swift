//
//  StartView.swift
//  Concentration
//
//  Created by 乐观的神 on 2021/10/12.
//

import SwiftUI

struct StartView: View {
    @State private var showGameView = false
    @State private var showDifficultySelectionView = false
    @State private var showRankListView = false

    var body: some View {
        ZStack {
            Color.init(.sRGB, red: 220/255, green: 220/255, blue: 220/255, opacity: 0.3)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("Concentration")
                    .font(.system(size: 80, design: .rounded))
                    .bold()
                    .padding(90)
                    .foregroundColor(Color.init(.sRGB, red: 255/255, green: 165/255, blue: 0/255, opacity: 0.8))
                    .shadow(color: .gray, radius: 3, x: 2, y: 3)
                Text("开始游戏")
                    .font(.system(size: 45, design: .rounded))
                    .bold()
                    .toButtonStyle()
                    .padding(30)
                    .fullScreenCover(isPresented: $showGameView) { GameView() }
                    .onTapGesture { showGameView.toggle() }

                Text("更改难度")
                    .font(.system(size: 45, design: .rounded))
                    .bold()
                    .toButtonStyle()
                    .padding(30)
                    .fullScreenCover(isPresented: $showDifficultySelectionView) { DifficultySelectionView() }
                    .onTapGesture { showDifficultySelectionView.toggle() }

                Text("排行榜")
                    .font(.system(size: 45, design: .rounded))
                    .bold()
                    .frame(width: 240, height: 100)
                    .toButtonStyle()
                    .padding(30)
                    .fullScreenCover(isPresented: $showRankListView) { RankListView() }
                    .onTapGesture { showRankListView.toggle() }
                Spacer()
            }
        }
        .onAppear { UserDefaults.standard.register(defaults: ["difficulty" : 4]) }

    }
}

struct ToButtonStyle: ViewModifier {

    func body(content: Content) -> some View {
        content
            .frame(width: 240, height: 100)
            .foregroundColor(.white)
            .background(Color.orange)
            .overlay(
                RoundedRectangle(cornerRadius: 70)
                    .stroke()
                    .foregroundColor(.orange)
            )
            .clipShape(RoundedRectangle(cornerRadius: 70))
    }
}
extension View {
    func toButtonStyle() -> some View {
        return self.modifier(ToButtonStyle())
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            StartView()
                .previewInterfaceOrientation(.landscapeLeft)
        } else {
            // Fallback on earlier versions
        }
    }
}
