//
//  ExtensionUIView.swift
//  CosmicShips
//
//  Created by Aleksandr Dorofeev on 24.08.2022.
//

import UIKit

protocol ReusableView: AnyObject {
  static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
  static var defaultReuseIdentifier: String {
    return NSStringFromClass(self)
  }
}

protocol NibLoadableView: AnyObject {
  static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
  static var nibName: String {
    return NSStringFromClass(self).components(separatedBy: ".").last!
  }
}
