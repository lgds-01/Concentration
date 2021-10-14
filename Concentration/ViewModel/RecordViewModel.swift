//
//  RecordViewModel.swift
//  Concentration
//
//  Created by 乐观的神 on 2021/10/13.
//

import Foundation

class RecordViewModel: ObservableObject {
    @Published var records = getRecords()

    static private func getRecords() -> [Record] {
        let data = UserDefaults.standard.data(forKey: "records")
        if let data = data {
            return try! JSONDecoder().decode([Record].self, from: data)
        }
        return [Record]()
    }

    func addRecord(username: String, grade: Int) {
        records.append(Record(username: username, grade: grade))
        storeAll()
    }

    func storeAll() {
        let data = try? JSONEncoder().encode(records)
        UserDefaults.standard.set(data, forKey: "records")
    }
}
