//
//  AMButton.swift
//
//  Created by abedalkareem omreyh on 8/24/18.
//  Copyright © 2018 abedalkareem omreyh. All rights reserved.
//

import Shared
import UIKit

@IBDesignable
class AMButton: UIButton {

  // MARK: - Styles

  @IBInspectable var isMainStyle: Bool = false {
    didSet {
      titleLabel?.font = UIFont(name: Theme.Fonts.bold, size: titleLabel?.font.pointSize ?? 17)
      backgroundColor = Theme.Colors.mainLight
      setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
    }
  }

  @IBInspectable var isWhiteStyle: Bool = false {
    didSet {
      titleLabel?.font = UIFont(name: Theme.Fonts.bold, size: titleLabel?.font.pointSize ?? 17)
      backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
      setTitleColor(Theme.Colors.main, for: .normal)
    }
  }

  @IBInspectable var isRegularStyle: Bool = false {
    didSet {
      titleLabel?.font = UIFont(name: Theme.Fonts.light, size: titleLabel?.font.pointSize ?? 17)
      backgroundColor = Theme.Colors.red
      setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
    }
  }

  @IBInspectable var isOutlineStyle: Bool = false {
    didSet {
      titleLabel?.font = UIFont(name: Theme.Fonts.light, size: titleLabel?.font.pointSize ?? 17)
      backgroundColor = Theme.Colors.main
      setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
    }
  }

  // MARK: - View lifecycle

  override func draw(_ rect: CGRect) { }

  override func layoutSubviews() {
    super.layoutSubviews()

    roundedCorner(radius: 10)
  }

}
