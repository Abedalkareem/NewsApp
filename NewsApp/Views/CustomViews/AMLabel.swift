//
//  AMLabel.swift
//
//  Created by abedalkareem omreyh on 8/24/18.
//  Copyright © 2018 abedalkareem omreyh. All rights reserved.
//

import UIKit
import Shared

@IBDesignable
class AMLabel: UILabel {
  
  
  // MARK: - Parameters

  @IBInspectable var isBold: Bool = false
  @IBInspectable var isLight: Bool = false
  
  // MARK: - View lifecycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    var fontName = ""
    if isBold {
      fontName = Constants.fonts.bold
    } else {
      fontName = Constants.fonts.light
    }
    
    font = UIFont(name: fontName, size: font.pointSize)
    
  }
  
  
  
}
