//
//  ErrorView.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 06/09/2022.
//  Copyright © 2022 abedalkareem. All rights reserved.
//

import Shared
import UIKit

class ErrorView: UIView {

  // MARK: - Private Properties

  var message: String? {
    didSet {
      isHidden = false
      label.text = message
    }
  }

  // MARK: - Private Properties

  private lazy var imageView: UIImageView = {
    let imageView = UIImageView(image: #imageLiteral(resourceName: "something_went_wrong"))
    imageView.contentMode = .scaleAspectFit
    imageView.tintColor = Theme.Colors.white
    return imageView
  }()

  private lazy var label: UILabel = {
    let label = AMLabel()
    label.isBold = true
    label.numberOfLines = 2
    label.textColor = Theme.Colors.white
    label.textAlignment = .center
    return label
  }()

  // MARK: - init

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }

  private func setup() {

    backgroundColor = .clear

    imageView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(imageView)
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: topAnchor),
      imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
      imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      imageView.heightAnchor.constraint(equalToConstant: 130)
    ])

    label.translatesAutoresizingMaskIntoConstraints = false
    addSubview(label)
    NSLayoutConstraint.activate([
      label.topAnchor.constraint(equalTo: imageView.bottomAnchor),
      label.bottomAnchor.constraint(equalTo: bottomAnchor),
      label.trailingAnchor.constraint(equalTo: trailingAnchor),
      label.leadingAnchor.constraint(equalTo: leadingAnchor)
    ])
  }

  // MARK: - Public Methods

  static func addTo(view: UIView) -> ErrorView {
    let errorView = ErrorView()
    view.addSubview(errorView)

    errorView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      errorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      errorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      errorView.widthAnchor.constraint(equalToConstant: 240),
      errorView.heightAnchor.constraint(equalToConstant: 180)
    ])

    errorView.isHidden = true

    return errorView
  }
}
