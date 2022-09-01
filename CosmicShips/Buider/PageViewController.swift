//
//  ShipPageViewController.swift
//  CosmicShips
//
//  Created by Aleksandr Dorofeev on 25.08.2022.
//

import UIKit

class PageViewController: UIPageViewController {
  let assemblyBuilder = AssemblyModuleBuilder()
  private var presenter: ShipViewPresenter?
  
  private var ship = [Ship]()
  
  override func viewDidLoad() {
    view.backgroundColor = .systemBackground
  }
  
  //MARK: - Wrong solution
//  lazy var arrayShipViewController: [ShipViewController] = {
//    var shipVc = [assemblyBuilder.createShipModule()]
//    for rockets in ship {
//      shipVc.append(ShipViewController())
//    }
//    return shipVc
//  }()
  
  override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
    super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)
    self.dataSource = self
    self.delegate = self
    setViewControllers([assemblyBuilder.createShipModule()], direction: .forward, animated: true)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
  
  //MARK: - DataSource(Handle setting and setting data in viewController)
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    //guard let viewController = viewController as? ShipViewController else {return nil}
    let index = ((viewController as? ShipViewController)?.index ?? 0) - 1
        return self.pageViewController(for: index)
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    let index = ((viewController as? ShipViewController)?.index ?? 0) + 1
    
    return self.pageViewController(for: index)
  }
  
  func pageViewController(for index: Int) -> ShipViewController? {
    let vc = ShipViewController()
    if index < 0 {
      return nil
    }
    
    if index > ship.count {
      return nil
    }
    
    //MARK: - Understand how to assign data
    vc.presenter?.ship = ship[index]
    return vc
  }
}
