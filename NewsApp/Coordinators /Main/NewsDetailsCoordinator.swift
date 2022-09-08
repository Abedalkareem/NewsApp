//
//  NewsDetailsCoordinator.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 11/4/18.
//  Copyright © 2018 abedalkareem. All rights reserved.
//

import Shared
import UIKit

class NewsDetailsCoordinator: Coordinator {

  // MARK: - Properties

  var presenter: UINavigationController?
  lazy var newsDetailsViewController: NewsDetailsViewController = {
    let newsDetailsViewController: NewsDetailsViewController = StoryboardUtil.viewController(storyboard: .main)
    newsDetailsViewController.newsViewModel = newsViewModel
    return newsDetailsViewController
  }()

  var newsViewModel: NewsViewModel?

  // MARK: - init

  init(presenter: UINavigationController, newsViewModel: NewsViewModel) {
    self.presenter = presenter
    self.newsViewModel = newsViewModel
  }

  // MARK: - Coordinator

  override func start() {
    guard let presenter = presenter else {
      return
    }
    presenter.pushViewController(newsDetailsViewController, animated: true)
  }

}
