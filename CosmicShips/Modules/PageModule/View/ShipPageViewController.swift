//
//  ShipPageViewController.swift
//  CosmicShips
//
//  Created by Aleksandr Dorofeev on 25.08.2022.
//

import UIKit

class ShipPageViewController: UIPageViewController, UIPageViewControllerDataSource {

  let vc = ShipViewController()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      self.dataSource = self
    
//      vc.loadShips {
//        DispatchQueue.main.async {
//          guard let vc = self.pageViewController(for: 0) else { return }
//          self.setViewControllers([vc], direction: .forward, animated: false, completion: nil)
//        }
//      }
    }
  
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    let index = ((viewController as? ShipViewController)?.index ?? 0) - 1
    return self.pageViewController(for: index)
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    let index = ((viewController as? ShipViewController)?.index ?? 0) + 1
    return self.pageViewController(for: index)
  }
  
  func pageViewController(for index: Int) -> ShipViewController? {
    let vc = storyboard?.instantiateViewController(withIdentifier: "shipId") as! ShipViewController

    if index < 0 {
      return nil
    }
    
    if index > vc.ships?.count ?? 4 {
      return nil
    }
    
    vc.ship = vc.ships?[index]
    vc.index = index
    return vc
  }
}
