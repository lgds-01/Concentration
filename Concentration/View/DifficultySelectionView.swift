//
//  DifficultySelectionView.swift
//  Concentration
//
//  Created by 乐观的神 on 2021/10/12.
//

import SwiftUI

struct DifficultySelectionView: View {
    @Environment(\.presentationMode) var presentationMode
    
    private let types = ["相当简单", "十分一般", "马马虎虎","有点难度","很有难度"]
    var difficulty: Int {
        UserDefaults.standard.integer(forKey: "difficulty")
    }
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    HStack {
                        Button(action: { presentationMode.wrappedValue.dismiss() }) {
                            Label("主菜单", systemImage: "chevron.backward")
                        }
                        .frame(width: 100, height: 35)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        VStack(alignment: .center) {
                            Text("游戏难度: \(types[GameViewModel.difficulties.firstIndex(of: difficulty) ?? 0])")
                                .font(.system(size: 50,design: .rounded))
                                .foregroundColor(.primary)
                                .frame(width: geometry.size.width, height: 180)

                            ForEach(types, id: \.self) { type in
                                Text("\(type)")
                                    .font(.system(size: 40))
                                    .bold()
                                    .toButtonStyle()
                                    .shadow(color: .gray, radius: 5, x: 3, y: 3)
                                    .padding()
                                    .onTapGesture {
                                        let value = GameViewModel.difficulties[types.firstIndex(of: type) ?? 0]
                                        UserDefaults.standard.set(value, forKey: "difficulty")
                                        presentationMode.wrappedValue.dismiss()
                                    }
                            }
                        }
                        Spacer()
                    }
                }
            }

        }
        .background(Color.init(.sRGB, red: 220/255, green: 220/255, blue: 220/255, opacity: 0.3))
    }
}

struct DifficultySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            DifficultySelectionView()
                .previewInterfaceOrientation(.landscapeLeft)
        } else {
            // Fallback on earlier versions
        }
    }
}
