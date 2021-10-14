//
//  HeaderView.swift
//  Concentration
//
//  Created by 乐观的神 on 2021/10/12.
//

import SwiftUI

struct HeaderView: View {
    @Environment(\.presentationMode) var presentationMode

    var grade = 0
    var restart: () -> Void
    var body: some View {
        HStack {
            Spacer()
            Button(action: {presentationMode.wrappedValue.dismiss()}) {
                Image(systemName: "arrowshape.turn.up.backward")
                    .resizable().scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.blue)
                    .padding(.horizontal, 50)
            }
            Text("分数: \(grade)")
                .font(.system(size: 40, design: .rounded))
                .foregroundColor(.primary)
                .padding()
            Button(action: restart) {
                Image(systemName: "restart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.blue)
                    .padding(.horizontal, 50)
            }
            Spacer()
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(restart: {})
    }
}

