//
//  ViewController.swift
//  CosmicShips
//
//  Created by Aleksandr Dorofeev on 22.08.2022.
//

import UIKit

class ShipViewController: UIViewController {
  var index = 0
  var presenter: ShipViewPresenter?
  
  @IBOutlet weak var shipTableView: UITableView!
  @IBOutlet weak var shipHeaderView: ShipHeaderView!
    
  override func viewDidLoad() {
    setupTableView()
  }
  
  func setupTableView() {
    shipTableView?.alpha = 1
    shipTableView?.contentInsetAdjustmentBehavior = .never
    shipTableView?.tableHeaderView = shipHeaderView
    shipTableView?.register(ShipCell.self)
  }
}

extension ShipViewController: ShipList {
  func showError(error: Error) {
    print(error.localizedDescription)
  }
}
