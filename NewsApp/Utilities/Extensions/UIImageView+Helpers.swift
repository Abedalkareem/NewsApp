//
//  ImageView.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 6/16/19.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import SDWebImage
import UIKit

extension UIImageView {

  func setImage(with url: String?, placeholderImage: UIImage) {
    if let imageLink = url, let url = URL(string: imageLink) {
      self.sd_setImage(with: url, placeholderImage: placeholderImage)
    } else {
      image = placeholderImage
    }
  }

}
