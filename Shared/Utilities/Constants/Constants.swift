//
//  Constants.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 11/4/18.
//  Copyright © 2018 abedalkareem. All rights reserved.
//

import UIKit

public enum Constants {

  enum Keys {
    static let apiKey: [UInt8] = [1, 120, 124, 123, 118, 113, 3, 18,
                                  1, 81, 17, 66, 112, 113, 97, 112, 6,
                                  86, 74, 85, 44, 122, 45, 35, 122, 3,
                                  17, 7, 3, 19, 28, 124]
  }

  enum Urls {
    public static let apiUrl = "https://newsapi.org/v2/"
  }

  public enum Errors {
    public static let parsing = NSError(domain: "",
                                        code: -2,
                                        userInfo: ["localizedDescription": "Error while getting the data"])
    public static let offline = NSError(domain: "",
                                        code: -3,
                                        userInfo: ["localizedDescription": "The Internet connection appears to be offline"])
    public static let responseFailure = NSError(domain: "",
                                                code: -4,
                                                userInfo: ["localizedDescription": "Failed to conect to server"])
  }

}

enum Endpoint: String {
  case topHeadlines = "top-headlines"
  case everything = "everything"
  case sources = "sources"
}
