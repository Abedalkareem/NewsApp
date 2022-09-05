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

  var presenter: UIViewController?
  lazy var introViewController: IntroViewController? = {
    return StoryboardUtil.viewController(IntroViewController.self, storyboard: .intro)
  }()

  // MARK: - init

  init(presenter: UIViewController) {
    self.presenter = presenter
  }

  // MARK: - Coordinator

  override func start() {
    guard let presenter = presenter, let introViewController = introViewController else {
      return
    }
    introViewController.modalTransitionStyle = .crossDissolve
    introViewController.delegate = self
    presenter.present(introViewController, animated: true, completion: nil)
  }

  override func finish() {
    introViewController = nil
  }

}

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
