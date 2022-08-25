//
//  ShipPresenter.swift
//  CosmicShips
//
//  Created by Aleksandr Dorofeev on 23.08.2022.
//

import Foundation
import UIKit

class ShipPresenter {
  var ships: [WelcomeElement]? = []
  
  private weak var view: ShipView?
  private let networkService: NetworkService

  required init(view: ShipView, networkService: NetworkService) {
    self.view = view
    self.networkService = networkService
    loadShips()
  }
  
  func loadShips() {
    
  }
}
