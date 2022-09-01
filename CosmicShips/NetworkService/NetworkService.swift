//
//  NetworkService.swift
//  CosmicShips
//
//  Created by Aleksandr Dorofeev on 30.08.2022.
//

import Foundation

class NetworkService: NetworkServiceProtocol {
  static let shared = NetworkService()
  
  //MARK: - Property
  let callString = "https://api.spacexdata.com/v4/rockets"
  
  func getShips(_ completion: @escaping (Result<[Ship]?, Error>) -> Void) {
    let urlCall = URL(string: callString)
    guard urlCall != nil else {
        print("Error")
        return
    }
    print(urlCall!)
    URLSession.shared.dataTask(with: urlCall!) { jsonData, _, error in
      if let error = error {
        completion(.failure(error))
        return
      }
      do {
        let obj = try JSONDecoder().decode([Ship].self, from: jsonData!)
        completion(.success(obj))
      }catch {
        completion(.failure(error))
      }
    }.resume()
  }
}
