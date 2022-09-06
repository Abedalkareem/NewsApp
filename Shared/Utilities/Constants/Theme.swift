//
//  Theme.swift
//  Shared
//
//  Created by abedalkareem omreyh on 7/20/19.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import UIKit

public enum Theme {

  public enum Colors {
    // Main app colors
    public static let main = #colorLiteral(red: 0.1529411765, green: 0.1529411765, blue: 0.2392156863, alpha: 1)
    public static let mainLight = #colorLiteral(red: 0.2, green: 0.1921568627, blue: 0.3137254902, alpha: 1)
    public static let red = #colorLiteral(red: 0.8078431373, green: 0.3176470588, blue: 0.2901960784, alpha: 1)
    public static let white = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
  }

  public enum Fonts {
    public static let light = "RobotoMono-Regular"
    public static let bold = "RobotoMono-Bold"
    public static let oldSchool = "Freshman"
  }

  public static func setAppStyle() {
    let fallbackFont = UIFont.systemFont(ofSize: 18)

    let titleFont = UIFont(name: Fonts.light, size: 18) ?? fallbackFont
    UINavigationBar.appearance()
      .titleTextAttributes = [
        NSAttributedString.Key.font: titleFont,
        NSAttributedString.Key.foregroundColor: UIColor.white
      ]

    let barButtonFont = UIFont(name: Fonts.bold, size: 17) ?? fallbackFont
    UIBarButtonItem.appearance()
      .setTitleTextAttributes([
        NSAttributedString.Key.font: barButtonFont
      ], for: .normal)

    UINavigationBar.appearance().backgroundColor = Colors.main
    UINavigationBar.appearance().barTintColor = Colors.main
    UINavigationBar.appearance().isTranslucent = true
    UIBarButtonItem.appearance().tintColor = UIColor.white
    UINavigationBar.appearance().shadowImage = UIImage()
    UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)

    UITableView.appearance().backgroundColor = Colors.main
  }
}
