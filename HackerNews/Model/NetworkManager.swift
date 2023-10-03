//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Kevin Gustavo Collado on 12/09/23.
//

import Foundation
import Alamofire


final class NetworkManager {
    static let sharedInstanced = NetworkManager()
    
    func getPost(handler: @escaping(_ apiData: Results)->(Void)) {
        let url = "https://hn.algolia.com/api/v1/search?tags=front_page"
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode(Results.self, from: data!)
                    handler(jsonData)
                    print(jsonData)
                }catch{
                    print(String(describing: error))
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
        
        //final class NetworkManager {
        //    static let sharedInstanced = NetworkManager()
        //    private let url = "https://hn.algolia.com/api/v1/search?tags=front_page"
        //
        //    func getPost(success: @escaping(_ apiData: Results)->(), failure: @escaping (_ error: Error?)->()){
        //        AF.request(url, method: .get).response { response in
        //            guard let data = response.data else {
        //                print("Error getting data from API")
        //                return
        //            }
        //
        //            switch response.result {
        //            case .success:
        //                do {
        //                    let jsonData = try JSONDecoder().decode(Results.self, from: data)
        //                    success(jsonData)
        //                } catch {
        //                    print(error)
        //                }
        //            case .failure(let error):
        //                print(error)
        //            }
        //
        //        }
        //    }
        //}
        
