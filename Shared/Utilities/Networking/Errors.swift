//
//  Errors.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 6/16/19.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import UIKit

enum Errors {

  public static var unknownError = NSError(domain: "error.unknown", code: -20, userInfo: ["": ""])
  public static var badURL = NSError(domain: "error.badurl", code: -10, userInfo: ["": ""])
}
