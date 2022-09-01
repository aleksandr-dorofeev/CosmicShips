//
//  NetworkServiceContract.swift
//  CosmicShips
//
//  Created by Aleksandr Dorofeev on 30.08.2022.
//

import Foundation


//MARK: - NetworkService protocol
protocol NetworkServiceProtocol {
  func getShips(_ completion: @escaping (Result<[Ship]?, Error>) -> Void)
}
