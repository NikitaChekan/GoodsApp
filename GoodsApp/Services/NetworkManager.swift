//
//  NetworkManager.swift
//  GoodsApp
//
//  Created by Nikita Chekan on 09.11.2022.
//

import Foundation
import Alamofire

enum Link: String {
    case baseURL = "https://api.escuelajs.co/api/v1/products/"
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchGoods(from url: String, completion: @escaping(Result<[Goods], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let courses = Goods.getGoods(from: value)
                    completion(.success(courses))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func fetchData(from url: String, completion: @escaping(Result<Data, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success(let imageData):
                    completion(.success(imageData))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
