//
//  RankListView.swift
//  Concentration
//
//  Created by 乐观的神 on 2021/10/13.
//

import SwiftUI

struct RankListView: View {
    @ObservedObject var recordModelView = RecordViewModel()

    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ScrollView {
            ZStack {
                LinearGradient(colors: [Color.init(red: 255/255, green: 192/255, blue: 203/255, opacity: 0.5), Color.init(red: 191/255, green: 239/255, blue: 255/255, opacity: 0.7)], startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Button(action: { presentationMode.wrappedValue.dismiss() }) {
                            Label("主菜单", systemImage: "chevron.backward")
                        }
                        .frame(width: 100, height: 35)
                        Spacer()
                    }
                    Spacer()
                }

                HStack {
                    Spacer()
                    VStack{
                        Text("天梯榜")
                            .font(.system(size: 50, design: .rounded))
                            .bold()
                            .padding()
                            .foregroundColor(Color.init(red: 255/255, green: 82/255, blue: 45/255))
                        VStack(alignment: .leading) {
                            ForEach(recordModelView.records) { record in
                                HStack {
                                    Text("第\(recordModelView.records.firstIndex(where: {$0.id == record.id})!+1)名:")
                                    Text("\(record.username)")
                                        .padding(.horizontal, 30)
                                    Text("分数: \(record.grade)")
                                }
                                .font(.system(size: 40, design: .rounded))
                                .foregroundColor(.black)
                                .padding()
                            }
                        }
                        Spacer()
                    }
                    Spacer()
                }
                .frame(minHeight: 1100, maxHeight: .infinity)
            }
        }

    }
}

struct RankListView_Previews: PreviewProvider {
    static var records = [Record]()
    static var previews: some View {
        RankListView()
    }
}
