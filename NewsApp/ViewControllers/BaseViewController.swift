//
//  BaseViewController.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 11/4/18.
//  Copyright © 2018 abedalkareem. All rights reserved.
//

import UIKit
import Shared
import LanguageManager_iOS

class BaseViewController: UIViewController {
  
  
  // MARK: - ViewController lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  func addChangeLanguageButton() {
    let languageButton = UIBarButtonItem(title: Utilities.isRightToLeft ? "main_english_language".localiz() : "main_arabic_language".localiz(), style: .plain, target: self, action: #selector(changeAppLanguage))
    navigationItem.rightBarButtonItem = languageButton
    navigationController?.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
  }
  
  /// Use it to add the App logo at the top right of the app
  func addAppLogo() {
    let logo = UIBarButtonItem(title: "main_n_char".localiz(), style: .plain, target: nil, action: nil)
    navigationItem.rightBarButtonItem = logo
    navigationController?.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
  }
  
  /// Use it to add the back button to the navigation bar
  func addBackButton() {
    let image = Utilities.isRightToLeft ? #imageLiteral(resourceName: "back_ar") : #imageLiteral(resourceName: "back")
    let backButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(pop))
    navigationItem.leftBarButtonItem = backButton
    navigationController?.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
  }
  
  @objc private func pop() {
    navigationController?.popViewController(animated: true)
  }
  
  /// Override it to handle the change button action
  @objc func changeAppLanguage() { }
  
  // MARK: - Hide show views
  
  func showAllViews() {
    UIView.animate(withDuration: 0.5) {
      self.view.subviews.forEach({ guard $0.tag != -1 else { return }; $0.alpha = 1 })
    }
  }
  
  func hideAllViews() {
    view.subviews.forEach({ guard $0.tag != -1 else { return }; $0.alpha = 0 })
  }
  
}
