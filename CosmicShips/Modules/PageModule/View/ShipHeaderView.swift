//
//  ShipHeaderView.swift
//  CosmicShips
//
//  Created by Aleksandr Dorofeev on 22.08.2022.
//

import UIKit

final class ShipHeaderView: UIView, ReusableView, NibLoadableView {
  
  @IBOutlet private weak var shipImageView: UIImageView!
  @IBOutlet private weak var shipNameLabel: UILabel!
  @IBOutlet private weak var shipIconLabel: UILabel!
  @IBOutlet private weak var shipCollectionView: UICollectionView!

  func configurateHeader(ship: WelcomeElement) {
    shipImageView.image = UIImage(named: ship.flickrImages[0])
    shipNameLabel.text = ship.name
  }
}
