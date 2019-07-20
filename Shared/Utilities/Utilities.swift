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
    UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: Theme.fonts.light, size: 18) ?? UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.white]
    
    UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: Theme.fonts.bold, size: 17) ?? UIFont.systemFont(ofSize: 18)], for: .normal)
    
    UINavigationBar.appearance().barTintColor = Theme.colors.main
    UINavigationBar.appearance().isTranslucent = false
    UIBarButtonItem.appearance().tintColor = UIColor.white
    UINavigationBar.appearance().shadowImage = UIImage()
    UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    
    
    UITableView.appearance().backgroundColor = Theme.colors.main
  }
  
}
