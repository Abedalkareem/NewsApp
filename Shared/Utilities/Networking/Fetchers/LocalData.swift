//
//  LocalData.swift
//  SharedTests
//
//  Created by abedalkareem omreyh on 6/16/19.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

class LocalData: Networking {
  
  func request(endpoint: EndPoint, completion: @escaping (Error?, Data?) -> Void) {
    let path = Bundle(for: type(of: self)).path(forResource: "\(endpoint)", ofType: "json")
    let data = try! Data(contentsOf: URL(fileURLWithPath: path!))
    completion(nil, data)
  }
  
}
