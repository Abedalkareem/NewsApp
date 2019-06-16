//
//  Utilities.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 11/4/18.
//  Copyright © 2018 abedalkareem. All rights reserved.
//

import UIKit
import LanguageManager_iOS

public class Utilities {

  public static var isRightToLeft: Bool {
    return LanguageManager.shared.isRightToLeft
  }

  public static func setAppStyle() {
    UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: Constants.fonts.light, size: 18) ?? UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.white]

    UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: Constants.fonts.bold, size: 17) ?? UIFont.systemFont(ofSize: 18)], for: .normal)


    UINavigationBar.appearance().barTintColor = Constants.colors.main
    UINavigationBar.appearance().isTranslucent = false
    UIBarButtonItem.appearance().tintColor = UIColor.white
  }

}
