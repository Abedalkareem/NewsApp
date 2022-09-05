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

  @IBOutlet private weak var newsImageView: UIImageView!
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var descriptionLabel: UILabel!
  @IBOutlet private weak var dateLabel: UILabel!
  @IBOutlet private weak var authorLabel: UILabel!

  // MARK: - Parameters

  var newsListViewModel: NewsListViewModel?

  // MARK: - ViewController lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "news_details_title".localize

    addAppLogo()
    addBackButton()

    setupViewController()
  }

  private func setupViewController() {
    guard let news = newsListViewModel?.selectedNews else {
      return
    }

    if let imageLink = news.urlToImage, let url = URL(string: imageLink) {
      newsImageView.setImage(with: url, placeholderImage: #imageLiteral(resourceName: "placeholder"))
    } else {
      newsImageView.image = #imageLiteral(resourceName: "placeholder")
    }

    titleLabel.text = news.title
    dateLabel.text = news.publishedAt

    descriptionLabel.text = news.description

    authorLabel.text = news.author != nil ? news.author : news.sourceName
    authorLabel.textColor = Theme.Colors.red
  }

}
