//
//  AssemblyModuleBuilder.swift
//  CosmicShips
//
//  Created by Aleksandr Dorofeev on 30.08.2022.
//

import UIKit

class AssemblyModuleBuilder: MvpModuleCreatable {
  func createShipModule() -> UIViewController {
    let view = ShipViewController()
    let networkService = NetworkService()
    let presenter = ShipListPresenter(view: view, networkService: networkService)
    view.presenter = presenter
    return view
  }
}
