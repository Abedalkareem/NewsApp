//
//  TableView.swift
//

import UIKit

extension UITableView {
  
  func register<T:UITableViewCell>(_: T.Type) {
    let bundle = Bundle(for: T.self)
    let nib =  UINib(nibName: T.nibName, bundle: bundle)
    register(nib, forCellReuseIdentifier: T.nibName)
  }
  
  func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withIdentifier: T.nibName, for: indexPath) as? T else {
      fatalError("Could not dequeue cell with identifier: \(T.nibName)")
    }
    return cell
  }
}

protocol NibLoadableView {
  static var nibName:String { get }
}

extension UITableViewCell: NibLoadableView {
  
  static var nibName: String {
    return String(describing: self)
  }
}
