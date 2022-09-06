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
    newsDetailsViewController.newsListViewModel = newsListViewModel
    return newsDetailsViewController
  }()

  var newsListViewModel: NewsListViewModel?

  // MARK: - init

  init(presenter: UINavigationController, newsListViewModel: NewsListViewModel) {
    self.presenter = presenter
    self.newsListViewModel = newsListViewModel
  }

  // MARK: - Coordinator

  override func start() {
    guard let presenter = presenter else {
      return
    }
    presenter.pushViewController(newsDetailsViewController, animated: true)
  }

}
