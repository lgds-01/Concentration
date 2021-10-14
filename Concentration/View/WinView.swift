//
//  WinView.swift
//  Concentration
//
//  Created by 乐观的神 on 2021/10/12.
//

import SwiftUI

struct WinView: View {
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var recordViewModel = RecordViewModel()

    @State private var username = ""

    var grade: Int

    var body: some View {
        GeometryReader { geometry in
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    
                    Text("🎉🎉恭喜你🎉🎉")
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                        .bold()
                    Text("🎉🎉通过了游戏🎉🎉")
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                        .bold()
                    HStack {
                        TextField("", text: $username)
                            .textFieldStyle(.roundedBorder)
                            .font(.system(size: 40))
                            .frame(width:250)
                            .cornerRadius(30)
                        Button(action: {
                            recordViewModel.addRecord(username: username, grade: grade)
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("留下你的传说")
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    Text("深藏功与名")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        .bold()
                        .onTapGesture { presentationMode.wrappedValue.dismiss() }

                    Spacer()
                }
                Spacer()
            }

        }
        .background(LinearGradient(colors: [.purple,.orange], startPoint: .bottomLeading, endPoint: .topTrailing))
    }
}
struct WinView_Previews: PreviewProvider {
    static var previews: some View {
        WinView(grade: 100)
    }
}
