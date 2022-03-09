//
//  Item.swift
//  HackerNews
//
//  Created by Faruk YILDIRIM on 9.03.2022.
//

import Foundation

struct Item: Decodable {
    let id: Int
    let kids: [Int]
    let score: Int
    let time: Int
    let title: String
    let type: String
    let url: String
}
