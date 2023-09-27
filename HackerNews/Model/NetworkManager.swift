//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Kevin Gustavo Collado on 12/09/23.
//

import Foundation


final class NetworkManager{
    let url = "https://hn.algolia.com/api/v1/search?tags=front_page"
    
    func gestPost(){
        if let url = URL(string: url){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do{
                            let results = try decoder.decode(Results.self, from: safeData)
                            print(results.hits)
                        }catch{
                            print("No se han encontrado entradas \(error.localizedDescription)")
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
}





