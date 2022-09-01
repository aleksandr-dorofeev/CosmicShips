//
//  BuilderContract.swift
//  CosmicShips
//
//  Created by Aleksandr Dorofeev on 30.08.2022.
//

import Foundation
import UIKit

protocol MvpModuleCreatable {
  //MARK: - Public methods
  func createShipModule() -> UIViewController
}
