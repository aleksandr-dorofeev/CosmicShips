//
//  ExtensionDataSource.swift
//  CosmicShips
//
//  Created by Aleksandr Dorofeev on 24.08.2022.
//

import Foundation
import UIKit

extension ShipViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: ShipCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
    let ships = ships?[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return ships?.count ?? 0
  }
}

