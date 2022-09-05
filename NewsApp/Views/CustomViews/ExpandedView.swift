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

  // MARK: - Parameters

  private var shapeLayer = CAShapeLayer()

  private var smallBezierPath: UIBezierPath {
    var viewFrame = frame
    viewFrame.origin.x = 0
    viewFrame.origin.y = 0
    return UIBezierPath(roundedRect: viewFrame,
                        byRoundingCorners: .allCorners,
                        cornerRadii: CGSize(width: viewFrame.width, height: viewFrame.height))
  }

  private var bigBezierPath: UIBezierPath {
    var viewFrame = frame
    let width = (superview?.frame.width ?? viewFrame.width) - 20
    viewFrame.origin.x = -(width / 2) + viewFrame.width / 2
    viewFrame.origin.y = -(width / 2) + viewFrame.width / 2
    viewFrame.size.width = width
    viewFrame.size.height = width
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
    CATransaction.begin()
    let animation = CABasicAnimation(keyPath: "path")
    animation.duration = 1.5
    animation.repeatCount = Float.infinity
    animation.toValue = bigBezierPath.cgPath
    animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
    animation.fillMode = .both
    animation.isRemovedOnCompletion = false

    shapeLayer.add(animation, forKey: nil)
    CATransaction.commit()
  }

  private func animateAlpha() {
    CATransaction.begin()
    let animation = CABasicAnimation(keyPath: "opacity")
    animation.duration = 1.5
    animation.repeatCount = Float.infinity
    animation.fromValue = 0.6
    animation.toValue = 0
    animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
    animation.fillMode = .both
    animation.isRemovedOnCompletion = false

    shapeLayer.add(animation, forKey: nil)
    CATransaction.commit()
  }

}
