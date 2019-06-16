//
//  AppCoordinator.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 11/4/18.
//  Copyright © 2018 abedalkareem. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
  
  // MARK: - Properties

  let window: UIWindow?
  
  lazy var rootViewController: SplashViewController = {
    return StoryboardUtil.viewController(SplashViewController.self, storyboard: .intro)
  }()
  
  // MARK: - init

  init(window: UIWindow) {
    self.window = window
  }
  
  // MARK: - Coordinator
  
  override func start() {
    guard let window = window else {
      return
    }
    rootViewController.delegate = self
    window.rootViewController = rootViewController
    window.makeKeyAndVisible()
  }
  
  
}

extension AppCoordinator: SplashViewControllerDelegate {
  func nextViewController() {
    let introCoordinator = IntroCoordinator(presenter: rootViewController)
    addChild(introCoordinator)
    introCoordinator.start()
  }
}
