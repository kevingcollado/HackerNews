//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Kevin Gustavo Collado on 12/09/23.
//

import Foundation
import Alamofire


final class NetworkManager {
    //Propiedad singleton
    static let sharedInstanced = NetworkManager()
    
    func getPost(handler: @escaping(_ apiData: Results)->(Void)) {
        //Constante url
        let url = "https://hn.algolia.com/api/v1/search?tags=front_page"
        //
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode(Results.self, from: data!)
                    handler(jsonData)
                }catch{
                    print(String(describing: error))
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
