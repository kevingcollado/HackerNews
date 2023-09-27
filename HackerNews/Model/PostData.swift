//
//  PostData.swift
//  HackerNews
//
//  Created by Kevin Gustavo Collado on 12/09/23.
//

import Foundation

struct Results: Decodable{
    let hits: [Post]
}

struct Post: Codable{
    let title: String
    let author: String
    let points: Int
    let url: String?
    let createdAt: String
}

let postTest = [Post(title: "iPhone 15 Pro", author: "Taringa", points: 5, url: nil, createdAt: "12/10/2023"),
                Post(title: "Como decodear un JSON", author: "KVN", points: 3, url: nil, createdAt: "11/10/2023"),
                Post(title: "Todo sobre celdas reusables", author: "Swift4All", points: 5, url: nil, createdAt: "13/10/2023"),
                Post(title: "Comprar el nuevo iPhone?", author: "Apple Hub", points: 5, url: nil, createdAt: "9/10/2023"),
                Post(title: "Twitter ahora X", author: "Entre parentesis", points: 5, url: nil, createdAt: "2/10/2023")]
