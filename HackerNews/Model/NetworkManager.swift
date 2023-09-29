//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Kevin Gustavo Collado on 12/09/23.
//

import Foundation
import Alamofire


final class NetworkManager {
    func getPost(handler: @escaping(_ apiData: Results)->(Void)) {
        AF.request("https://hn.algolia.com/api/v1/search?tags=front_page").response { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode(Results.self, from: data!)
                    handler(jsonData)
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}


//    if let url = URL(string: url){
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: url) { (data, response, error) in
//            if error == nil{
//                let decoder = JSONDecoder()
//                if let safeData = data{
//                    do{
//                        let results = try decoder.decode(Results.self, from: safeData)
//                        print(results.hits)
//                    }catch{
//                        print("No se han encontrado entradas \(error.localizedDescription)")
//                    }
//                }
//            }
//        }
//        task.resume()
//    }
//}


