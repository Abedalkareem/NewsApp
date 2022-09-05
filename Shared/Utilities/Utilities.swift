//
//  Utilities.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 11/4/18.
//  Copyright © 2018 abedalkareem. All rights reserved.
//

import UIKit

public class Utilities {

  public static var isRightToLeft: Bool {
    return LocalizationHelper.isRightToLeft
  }

  public static func setAppStyle() {
    let fallbackFont = UIFont.systemFont(ofSize: 18)

    let titleFont = UIFont(name: Theme.Fonts.light, size: 18) ?? fallbackFont
    UINavigationBar.appearance()
      .titleTextAttributes = [
        NSAttributedString.Key.font: titleFont,
        NSAttributedString.Key.foregroundColor: UIColor.white
      ]

    let barButtonFont = UIFont(name: Theme.Fonts.bold, size: 17) ?? fallbackFont
    UIBarButtonItem.appearance()
      .setTitleTextAttributes([
        NSAttributedString.Key.font: barButtonFont
      ], for: .normal)

    UINavigationBar.appearance().barTintColor = Theme.Colors.main
    UINavigationBar.appearance().isTranslucent = false
    UIBarButtonItem.appearance().tintColor = UIColor.white
    UINavigationBar.appearance().shadowImage = UIImage()
    UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)

    UITableView.appearance().backgroundColor = Theme.Colors.main
  }

}
