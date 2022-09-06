//
//  IntroCoordinator.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 11/4/18.
//  Copyright © 2018 abedalkareem. All rights reserved.
//

import UIKit

class IntroCoordinator: Coordinator {

  // MARK: - Properties

  private let window: UIWindow?
  lazy var introViewController: IntroViewController? = {
    return StoryboardUtil.viewController(storyboard: .intro)
  }()

  // MARK: - init

  init(window: UIWindow?) {
    self.window = window
  }

  // MARK: - Coordinator

  override func start() {
    guard let window = window, let introViewController = introViewController else {
      return
    }
    introViewController.modalTransitionStyle = .crossDissolve
    introViewController.delegate = self
    window.rootViewController = introViewController
  }

  override func finish() {
    introViewController = nil
  }

}

// MARK: - IntroViewControllerDelegate

extension IntroCoordinator: IntroViewControllerDelegate {
  func nextViewController() {
    guard let introViewController = introViewController else {
      return
    }
    let mainCoordinator = MainCoordinator(presenter: introViewController)
    addChild(mainCoordinator)
    mainCoordinator.start()
  }
}
