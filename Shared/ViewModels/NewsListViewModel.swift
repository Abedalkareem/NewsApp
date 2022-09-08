//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 11/4/18.
//  Copyright © 2018 abedalkareem. All rights reserved.
//

import UIKit

public class NewsListViewModel {

  // MARK: - Properties

  public var news: Observable<[NewsViewModel]>?
  public var error: Observable<Error>?
  public weak var coordinatorDelegate: NewsViewModelDelegate?

  // MARK: - Private Properties

  private var newsServices: NewsServices

  // MARK: - init

  public init(newsServices: NewsServices) {
    self.newsServices = newsServices
    self.news = Observable()
    self.error = Observable()
  }

  // MARK: - Public methods

  public func getTopHeadlines(complition: (() -> Void)? = nil) {

    newsServices.getTopHeadlines { (news, error) in
      guard error == nil else {
        self.error?.value = error
        return
      }
      self.news?.value = news
    }
  }

  public func itemFor(_ indexPath: IndexPath) -> NewsViewModel? {
    return news?.value?[indexPath.row]
  }

  public func numberOfRowIn(_ section: Int) -> Int {
    return news?.value?.count ?? 0
  }

  public func didSelectItemAt(_ indexPath: IndexPath) {
    guard let selectedNews = news?.value?[indexPath.row] else {
      return
    }
    coordinatorDelegate?.open(news: selectedNews)
  }

  public func heightOfRowAt(_ indexPath: IndexPath) -> CGFloat {
    return 100
  }

  public func languageDidChanged() {
    coordinatorDelegate?.languageDidChanged()
  }

}

public protocol NewsViewModelDelegate: AnyObject {
  func open(news: NewsViewModel)
  func languageDidChanged()
}
