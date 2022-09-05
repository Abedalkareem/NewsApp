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

    setup()
  }

  // MARK: - Private method

  private func setup() {
    view.backgroundColor = Theme.Colors.main
  }

  @objc
  private func pop() {
    navigationController?.popViewController(animated: true)
  }

  // MARK: - Public method

  /// Adds the App logo at the top right of the navigation bar.
  func addAppLogo() {
    let logo = UIBarButtonItem(title: "main_n_char".localize, style: .plain, target: nil, action: nil)
    logo.setTitleTextAttributes([
      NSAttributedString.Key.font: UIFont(name: Theme.Fonts.oldSchool, size: 20)!
      ], for: .normal)
    navigationItem.rightBarButtonItem = logo
  }

  /// Adds the back button to the navigation bar.
  func addBackButton() {
    let image = Utilities.isRightToLeft ? #imageLiteral(resourceName: "back_ar") : #imageLiteral(resourceName: "back")
    let backButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(pop))
    navigationItem.leftBarButtonItem = backButton
  }

  /// Adds the change language button at the top right of the navigation bar.
  func addChangeLanguageButton() {
    let languageButton = UIBarButtonItem(image: #imageLiteral(resourceName: "world"), style: .plain, target: self, action: #selector(changeAppLanguage))
    navigationItem.rightBarButtonItem = languageButton
  }

  /// Override it to handle the change language action button.
  @objc
  func changeAppLanguage() { }

}
