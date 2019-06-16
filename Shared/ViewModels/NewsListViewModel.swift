//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 11/4/18.
//  Copyright © 2018 abedalkareem. All rights reserved.
//

import UIKit

public class NewsListViewModel {

  // MARK: - Parameters

  public var news: Observable<[NewsViewModel]>?
  public var error: Observable<Error>?
  public var selectedNews: NewsViewModel!
  public weak var coordinatorDelegate: NewsViewModelDelegate?


  public init(news: [NewsViewModel] = []) {
    self.news = Observable(news)
    self.error = Observable()
  }

  // MARK: - Public methods
  
  public func getTopHeadlines(complition: (() -> Void)? = nil) {

    NewsServices.getTopHeadlines { (news, error) in
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
    selectedNews = news?.value?[indexPath.row]
    coordinatorDelegate?.openNews()
  }

  public func heightOfRowAt(_ indexPath: IndexPath) -> CGFloat {
    return 100
  }

  public func languageDidChanged() {
    coordinatorDelegate?.languageDidChanged()
  }

}



public protocol NewsViewModelDelegate: AnyObject {
  func openNews()
  func languageDidChanged()
}
