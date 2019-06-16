//
//  SplashViewController.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 11/4/18.
//  Copyright © 2018 abedalkareem. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController {
  
  
  // MARK: - Properties

  weak var delegate: SplashViewControllerDelegate?
  
  
  // MARK: - ViewController lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    nextPage()
    
  }
  
  private func nextPage() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      self.delegate?.nextViewController()
    }
  }
  
  
}

protocol SplashViewControllerDelegate: AnyObject {
  func nextViewController()
}
