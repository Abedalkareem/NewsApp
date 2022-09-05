//
//  Networking.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 6/16/19.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import UIKit

public protocol Networking {

  func request(endpoint: EndPoint, completion: @escaping (Error?, Data?) -> Void)
}

public protocol Fetcher {

  func fetch<T: Decodable>(endpoint: EndPoint, completion: @escaping (Error?, T?) -> Void)
  func fetch<T: Decodable>(endpoint: EndPoint, completion: @escaping (Error?, [T]?) -> Void)
}
