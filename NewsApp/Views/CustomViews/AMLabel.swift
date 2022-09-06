//
//  AMLabel.swift
//
//  Created by abedalkareem omreyh on 8/24/18.
//  Copyright © 2018 abedalkareem omreyh. All rights reserved.
//

import Shared
import UIKit

@IBDesignable
class AMLabel: UILabel {

  // MARK: - Parameters

  @IBInspectable var isOldSchool: Bool = false
  @IBInspectable var isBold: Bool = false
  @IBInspectable var isLight: Bool = false

  // MARK: - View lifecycle

  override func awakeFromNib() {
    super.awakeFromNib()

    updateFont()
  }

  private func updateFont() {
    var fontName = ""
    if isBold {
      fontName = Theme.Fonts.bold
    } else if isOldSchool {
      fontName = Theme.Fonts.oldSchool
    } else {
      fontName = Theme.Fonts.light
    }

    font = UIFont(name: fontName, size: font.pointSize)
  }

}
