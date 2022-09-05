//
//  ExpandedView.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 11/4/18.
//  Copyright © 2018 abedalkareem. All rights reserved.
//

import Shared
import UIKit

class ExpandedView: UIView {

  // MARK: - Private Properties

  private var shapeLayer = CAShapeLayer()

  private var smallBezierPath: UIBezierPath {
    return UIBezierPath(roundedRect: bounds,
                        byRoundingCorners: .allCorners,
                        cornerRadii: CGSize(width: bounds.width, height: bounds.height))
  }

  private var bigBezierPath: UIBezierPath {
    var viewFrame = bounds.applying(.init(scaleX: 2, y: 2))
    viewFrame.origin.x = -(bounds.width / 2)
    viewFrame.origin.y = -(bounds.width / 2)
    return UIBezierPath(roundedRect: viewFrame,
                        byRoundingCorners: .allCorners,
                        cornerRadii: CGSize(width: viewFrame.width, height: viewFrame.height))
  }

  // MARK: - View lifecycle

  override func awakeFromNib() {
    super.awakeFromNib()
    layer.addSublayer(shapeLayer)
  }

  override func draw(_ rect: CGRect) {
    shapeLayer.fillColor = UIColor.white.cgColor

    shapeLayer.path = smallBezierPath.cgPath

    expandAnimation()
    animateAlpha()
  }

  // MARK: - Animation

  private func expandAnimation() {
    let animation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.path))
    animation.duration = 1.5
    animation.repeatCount = Float.infinity
    animation.toValue = bigBezierPath.cgPath
    animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
    animation.fillMode = .both
    animation.isRemovedOnCompletion = false
    shapeLayer.add(animation, forKey: nil)
  }

  private func animateAlpha() {
    let animation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.opacity))
    animation.duration = 1.5
    animation.repeatCount = Float.infinity
    animation.fromValue = 0.6
    animation.toValue = 0
    animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
    animation.fillMode = .both
    animation.isRemovedOnCompletion = false

    shapeLayer.add(animation, forKey: nil)
  }

}
