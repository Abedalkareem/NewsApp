//
//  MainCoordinator.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 11/4/18.
//  Copyright © 2018 abedalkareem. All rights reserved.
//

import LanguageManager_iOS
import Shared
import UIKit

class MainCoordinator: Coordinator {

  // MARK: - Properties

  var presenter: UIViewController?
  lazy var mainViewController: MainViewController = {
    let mainViewController = StoryboardUtil.viewController(MainViewController.self, storyboard: .main)
    mainViewController.newsListViewModel = newsListViewModel
    return mainViewController
  }()

  lazy var rootViewController: UINavigationController = {
    return UINavigationController(rootViewController: mainViewController)
  }()

  lazy var newsListViewModel: NewsListViewModel = {
    let newsServices = NewsServices(dataManager: DataManager(networking: HttpClient()))
    let newsListViewModel = NewsListViewModel(newsServices: newsServices)
    newsListViewModel.coordinatorDelegate = self
    return newsListViewModel
  }()

  // MARK: - init

  init(presenter: UIViewController) {
    self.presenter = presenter
  }

  // MARK: - Coordinator

  override func start() {
    guard let presenter = presenter else {
      return
    }
    rootViewController.modalTransitionStyle = .crossDissolve
    presenter.present(rootViewController, animated: true, completion: nil)
  }

}

extension MainCoordinator: NewsViewModelDelegate {

  func openNews() {
    let newsDetailsCoordinator = NewsDetailsCoordinator(presenter: rootViewController, newsListViewModel: newsListViewModel)
    addChild(newsDetailsCoordinator)
    newsDetailsCoordinator.start()
  }

  func languageDidChanged() {
    let mainViewController = StoryboardUtil.viewController(MainViewController.self, storyboard: .main)
    mainViewController.newsListViewModel = newsListViewModel
    self.mainViewController = mainViewController

    rootViewController = UINavigationController(rootViewController: mainViewController)

    let language: Languages = Utilities.isRightToLeft ? .en : .ar
    LanguageManager.shared.setLanguage(language: language,
                                       viewControllerFactory: { [weak self] _ in
      return self?.rootViewController ?? UIViewController()
    },
                                       animation: { view in
                                         view.frame = CGRect(x: 0,
                                                             y: -view.frame.height,
                                                             width: view.frame.width,
                                                             height: view.frame.height)
                                       })

  }
}
