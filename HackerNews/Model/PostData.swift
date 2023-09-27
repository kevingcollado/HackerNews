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
    let createdAt: Date
    
    
}


