//
//  ShipsScreenContracts.swift
//  CosmicShips
//
//  Created by Aleksandr Dorofeev on 30.08.2022.
//

import Foundation

//MARK: - Ships screen protocols

protocol ShipList: AnyObject {
  func showError(error: Error)
}

protocol ShipViewPresenter: AnyObject {
  var ship: Ship? {get set}
  
  init(view: ShipList, networkService: NetworkServiceProtocol)
  func loadShips()
}
