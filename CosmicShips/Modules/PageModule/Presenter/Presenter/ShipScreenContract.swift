//
//  ShipScreenContract.swift
//  CosmicShips
//
//  Created by Aleksandr Dorofeev on 23.08.2022.
//

import Foundation

protocol ShipView: AnyObject {
  func reloadShipView()
}

protocol ShipViewPresenter: AnyObject {
  var ships: [WelcomeElement]? {get}
  init(view: ShipView, networkService: NetworkServiceProtocol)
  func loadShips()
}
