//
//  BaseViewController.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 11/4/18.
//  Copyright © 2018 abedalkareem. All rights reserved.
//

import Shared
import UIKit

class BaseViewController: UIViewController {

  // MARK: - ViewController lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = Theme.Colors.main
  }

  /// Use it to add the App logo at the top right of the app
  func addAppLogo() {
    let logo = UIBarButtonItem(title: "main_n_char".localize, style: .plain, target: nil, action: nil)
    logo.setTitleTextAttributes([
      NSAttributedString.Key.font: UIFont(name: Theme.Fonts.oldSchool, size: 20)!
      ], for: .normal)
    navigationItem.rightBarButtonItem = logo
  }

  /// Use it to add the back button to the navigation bar
  func addBackButton() {
    let image = Utilities.isRightToLeft ? #imageLiteral(resourceName: "back_ar") : #imageLiteral(resourceName: "back")
    let backButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(pop))
    navigationItem.leftBarButtonItem = backButton
  }

  func addChangeLanguageButton() {
    let languageButton = UIBarButtonItem(image: #imageLiteral(resourceName: "world"), style: .plain, target: self, action: #selector(changeAppLanguage))
    navigationItem.rightBarButtonItem = languageButton
  }

  /// Override it to handle the change button action
  @objc
  func changeAppLanguage() { }

  @objc
  private func pop() {
    navigationController?.popViewController(animated: true)
  }

}
