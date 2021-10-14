//
//  Record.swift
//  Concentration
//
//  Created by 乐观的神 on 2021/10/13.
//

import Foundation

struct Record: Identifiable, Codable {
    var id = UUID()
    var username: String
    var grade: Int
}
