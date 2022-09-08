//
//  NewsDetailsViewController.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 11/4/18.
//  Copyright © 2018 abedalkareem. All rights reserved.
//

import Shared
import UIKit

class NewsDetailsViewController: BaseViewController {

  // MARK: - IBOutlets

  @IBOutlet private weak var dividerLabel: AMLabel!
  @IBOutlet private weak var newsImageView: UIImageView!
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var descriptionLabel: UILabel!
  @IBOutlet private weak var dateLabel: UILabel!
  @IBOutlet private weak var authorLabel: UILabel!

  // MARK: - Private Properties

  var newsViewModel: NewsViewModel?
  var errorView: ErrorView?

  // MARK: - ViewController lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    setup()

    setupViewController()
  }

  private func setup() {
    title = "news_details_title".localize

    addAppLogo()
    addBackButton()

    errorView = ErrorView.addTo(view: view)
  }

  private func setupViewController() {
    guard let news = newsViewModel else {
      showErrorMessage()
      return
    }

    newsImageView.setImage(with: news.urlToImage,
                           placeholderImage: #imageLiteral(resourceName: "placeholder"))

    titleLabel.text = news.title
    dateLabel.text = news.publishedAt

    descriptionLabel.text = news.description

    authorLabel.text = news.author
    authorLabel.textColor = Theme.Colors.red
  }

  private func showErrorMessage() {
    titleLabel.text = ""
    descriptionLabel.text = ""
    dateLabel.text = ""
    authorLabel.text = ""
    dividerLabel.text = ""

    errorView?.message = "something_went_wrong".localize
  }
}
