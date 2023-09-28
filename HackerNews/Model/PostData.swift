//
//  PostData.swift
//  HackerNews
//
//  Created by Kevin Gustavo Collado on 12/09/23.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable{
    let objectID: String
    let title: String
    let author: String
    let points: Int
    let url: String?
    let created_at: String
}

let postTest = [Post(objectID: "1", title: "iPhone 15 Pro", author: "Taringa", points: 4, url: nil, created_at: "12/10/2023"),
                Post(objectID: "2", title: "Como decodear un JSON", author: "KVN", points: 3, url: nil, created_at: "11/10/2023"),
                Post(objectID: "3", title: "Todo sobre celdas reusables", author: "Swift4All", points: 5, url: nil, created_at: "13/10/2023"),
                Post(objectID: "4", title: "Comprar el nuevo iPhone?", author: "Apple Hub", points: 5, url: nil, created_at: "9/10/2023"),
                Post(objectID: "5", title: "Twitter ahora X", author: "Entre parentesis", points: 5, url: nil, created_at: "2/10/2023")]
