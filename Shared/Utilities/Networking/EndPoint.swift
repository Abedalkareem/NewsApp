//
//  EndPoint.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 6/16/19.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import UIKit

public enum EndPoint {
  case topHeadlines
  case everything
  case sources
}

extension EndPoint {
  var url: String {
    var url = "https://newsapi.org/v2/"
    switch self {
    case .topHeadlines:
      url += "top-headlines"
    case .everything:
      url += "everything"
    case .sources:
      url += "sources"
    }

    if httpMethod == .get {
      url = "\(url)?\(queryParameters)"
    }

    return url
  }

  var parameters: [String: Any] {
    var params = ["apiKey": Obfuscator.deObfuscate("dJHKGHas34#$DFSAdas", Constants.keys.apiKey)]
    switch self {
    case .topHeadlines:
      params["country"] = Utilities.isRightToLeft ? "ae" : "us"
    case .everything, .sources:
      break
    }

    return params
  }

  var httpMethod: HttpMethod {
    switch self {
    case .topHeadlines, .everything, .sources:
      return .get
    }
  }

  var queryParameters: String {
    return parameters.map { "\($0.key)=\($0.value)" }.joined(separator: "&")
  }
}

enum HttpMethod: String {
  case get
  case post
}

extension HttpMethod {
  var name: String {
    return self.rawValue
  }
}
