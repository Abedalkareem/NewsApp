//
//  NewsServices.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 11/4/18.
//  Copyright © 2018 abedalkareem. All rights reserved.
//

import UIKit

public class NewsServices {
  
  private let dataManager: DataManager
  
  public init(dataManager: DataManager) {
    self.dataManager = dataManager
  }
  
  public func getTopHeadlines(complition: @escaping ([NewsViewModel]?, Error?) -> Void) {
    
    dataManager.fetch(endpoint: .topHeadlines) { (error, topHeadlines: TopHeadlines?) in
      guard error == nil else {
        complition(nil, error)
        return
      }
      complition(topHeadlines?.articles?.map(NewsViewModel.init), nil)
    }
    
  }
  
}

fileprivate struct TopHeadlines: Decodable {
  let status: String?
  let totalResults: Int?
  let articles: [News]?
}
