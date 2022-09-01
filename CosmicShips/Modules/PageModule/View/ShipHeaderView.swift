//
//  ShipHeaderView.swift
//  CosmicShips
//
//  Created by Aleksandr Dorofeev on 22.08.2022.
//

import UIKit

final class ShipHeaderView: UIView, ReusableView, NibLoadableView {
  
  @IBOutlet public weak var shipImageView: UIImageView!
  @IBOutlet public weak var shipNameLabel: UILabel!
  @IBOutlet public weak var shipIconLabel: UILabel!
  @IBOutlet public weak var shipCollectionView: UICollectionView!

  func configurateHeader(ship: Ship) {
    shipImageView.image = UIImage(named: ship.flickrImages[0])
    shipNameLabel.text = ship.name
  }
}
