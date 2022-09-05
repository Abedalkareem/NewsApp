//
//  LoadingHelper.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 6/16/19.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import AMProgressHUD
import UIKit

class LoadingHelper {

  private init() {}

  static func show() {
    AMProgressHUD.show()
  }

  static func dismiss() {
    AMProgressHUD.dismiss()
  }

  static func setup() {
    AMProgressHUD.options.imageName = "loading"
  }

}
