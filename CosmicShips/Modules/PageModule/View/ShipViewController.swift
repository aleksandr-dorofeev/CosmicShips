//
//  ViewController.swift
//  CosmicShips
//
//  Created by Aleksandr Dorofeev on 22.08.2022.
//

import UIKit

class ShipViewController: UIViewController {
      
  @IBOutlet weak var shipTableView: UITableView?
  @IBOutlet weak var shipHeaderView: ShipHeaderView!
  var index: Int = 0
  public var ships: [WelcomeElement]? = []
  var ship: WelcomeElement!
  
  override func viewDidLoad() {
    setupTableView()
    loadShips(complitionHandler: nil)
  }
  
  func getShip(_ completion: @escaping (Result<[WelcomeElement]?, Error>) -> Void) {
    let urlString = "https://api.spacexdata.com/v4/rockets"
    let urlComponents = URLComponents(string: urlString)
    
    guard let url = urlComponents?.url else {return}
    URLSession.shared.dataTask(with: url) { jsonData, _, error in
      if let error = error {
        completion(.failure(error))
        return
      }
      do {
        let obj = try JSONDecoder().decode([WelcomeElement].self, from: jsonData!)
        completion(.success(obj))
        print(obj.first?.name ?? "Ship name")
      } catch {
        completion(.failure(error))
      }
    }.resume()
  }
  
  func loadShips(complitionHandler: (() -> Void)?) {
    getShip { [weak self] result in
      guard let self = self else {return}
      DispatchQueue.main.async { [self] in
        switch result {
        case .success(let ships):
          guard !ships!.isEmpty else {
            self.shipTableView?.reloadData()
            return
          }
          self.ships?.append(contentsOf: ships ?? [])
          self.shipTableView?.reloadData()
          print(ships!.count)
        case .failure(let error):
          print(error)
        }
      }
      complitionHandler?()
    }
  }
  
  func setupTableView() {
    shipTableView?.alpha = 1
    shipTableView?.contentInsetAdjustmentBehavior = .never
    shipTableView?.tableHeaderView = shipHeaderView
    shipTableView?.register(ShipCell.self)
  }
  
//  func shownShip(ship: WelcomeElement?) {
//    shipHeaderView.configurateHeader(ship: ship!)
//  }
}


