//
//  NewsServices.swift
//  SharedTests
//
//  Created by abedalkareem omreyh on 6/16/19.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import Shared

class LocalNewsServices {

  private static var dataManger: DataManager = { DataManager(networking: LocalData()) }()

  class func getTopHeadlines(complition: @escaping ([NewsViewModel]?, Error?) -> Void) {

    dataManger.fetch(endpoint: .topHeadlines) { (error, topHeadlines: TopHeadlines?) in
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
