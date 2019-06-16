//
//  Constants.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 11/4/18.
//  Copyright © 2018 abedalkareem. All rights reserved.
//

import UIKit

public enum Constants {

  public enum colors {
    // Main app colors
    public static let main = #colorLiteral(red: 0.743095696, green: 0.2857166827, blue: 0.3647053242, alpha: 1)
    public static let mid = #colorLiteral(red: 0.6494776607, green: 0.2532873154, blue: 0.3134898543, alpha: 1)
    public static let dark = #colorLiteral(red: 0.4563460946, green: 0.1812899113, blue: 0.226479739, alpha: 1)
  }

  enum keys {
    static let apiKey: [UInt8] = [1, 120, 124, 123, 118, 113, 3, 18, 1, 81, 17, 66, 112, 113, 97, 112, 6, 86, 74, 85, 44, 122, 45, 35, 122, 3, 17, 7, 3, 19, 28, 124]
  }

  public enum fonts {
    public static let light = "Swiss721BT-Light"
    public static let bold = "Swiss721BT-BlackNo2"
  }

  enum urls {
    public static let apiUrl = "https://newsapi.org/v2/"
  }

  public enum errors {
    public static let parsing = NSError(domain: "", code: -2, userInfo: ["localizedDescription": "Error while getting the data"])
    public static let offline = NSError(domain: "", code: -3, userInfo: ["localizedDescription": "The Internet connection appears to be offline"])
    public static let responseFailure = NSError(domain: "", code: -4, userInfo: ["localizedDescription": "Failed to conect to server"])
  }


}

enum Endpoint: String {
  case topHeadlines = "top-headlines"
  case everything = "everything"
  case sources = "sources"
}
