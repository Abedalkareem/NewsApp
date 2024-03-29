//
//  LocalizationHelper.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 5/12/19.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import LanguageManager_iOS
import UIKit

enum LocalizationHelper {

  static var isRightToLeft: Bool {
    return LanguageManager.shared.isRightToLeft
  }

  static var local: Locale {
    return LanguageManager.shared.appLocale
  }

  static var defaultLanguage: Languages {
    get {
      return LanguageManager.shared.defaultLanguage
    }
    set {
      LanguageManager.shared.defaultLanguage = newValue
    }
  }

  static var currentLanguage: Languages {
    return LanguageManager.shared.currentLanguage
  }

  static func printFontsNames() {
    UIFont.familyNames
      .forEach { family in  UIFont.fontNames(forFamilyName: family).forEach { print("Font name: " + $0) } }
  }

  static func setLanguage(id: Int,
                          viewController: UIViewController? = nil,
                          animation: ((UIView) -> Void)? = nil) {
    let language: Languages = id == 0 ? .en : .ar
    LanguageManager.shared.setLanguage(language: language,
                                       viewControllerFactory: { _ in
      return viewController ?? UIViewController()
    },
                                       animation: animation)
  }

}

extension String {
  var localize: String {
    return self.localiz()
  }
}
