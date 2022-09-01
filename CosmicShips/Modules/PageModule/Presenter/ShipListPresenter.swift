//
//  ShipListPresenter.swift
//  CosmicShips
//
//  Created by Aleksandr Dorofeev on 30.08.2022.
//

import Foundation
import UIKit

class ShipListPresenter: ShipViewPresenter {
  
  var ship: Ship?
  
  //MARK: - Private proprties
  private weak var view: ShipList?
  private let networkService: NetworkServiceProtocol?
  var ships: [Ship]? = []
  
  //MARK: - Initialization
  required init(view: ShipList, networkService: NetworkServiceProtocol) {
    self.view = view
    self.networkService = networkService
    loadShips()
  }
  
  func loadShips() {
    networkService?.getShips{ [weak self] result in
      guard let self = self else { return }
      DispatchQueue.main.async { [self] in
        switch result {
        case .success(let ships):
          guard !ships!.isEmpty else { return }
          self.ships?.append(contentsOf: ships!)
        case .failure(let error):
          print(error)
        }
      }
    }
  }
}

