//
//  StoryboardUtil.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 11/4/18.
//  Copyright © 2018 abedalkareem. All rights reserved.
//

import UIKit

class StoryboardUtil {

  private init() {}

  static func viewController<T: UIViewController>(_ viewController: T.Type, storyboard: Storyboards) -> T {
    let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
    return storyboard.instantiateViewController(withIdentifier: String(describing: viewController.self)) as! T
  }

}

enum Storyboards: String {
  case intro = "Intro"
  case main = "Main"
}
