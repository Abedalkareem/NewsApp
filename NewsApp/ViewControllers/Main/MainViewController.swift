//
//  MainViewController.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 11/4/18.
//  Copyright © 2018 abedalkareem. All rights reserved.
//

import Shared
import UIKit

class MainViewController: BaseViewController {

  // MARK: - IBOutlets

  @IBOutlet private weak var tableView: UITableView!

  // MARK: - Private Properties

  var newsListViewModel: NewsListViewModel?
  var errorView: ErrorView?

  // MARK: - ViewController lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    setup()

    addChangeLanguageButton()

    registerCells()
    observeForChanges()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    getNews()
  }

  private func setup() {
    title = "main_title_top_headlins".localize
    errorView = ErrorView.addTo(view: view)
  }

  private func getNews() {
    LoadingHelper.show()
    newsListViewModel?.getTopHeadlines()
  }

  private func observeForChanges() {
    newsListViewModel?.news?.bind(observer: { [weak self] _ in
      LoadingHelper.dismiss()
      self?.hideError()
      self?.tableView.reloadData()
    })
    newsListViewModel?.error?.bind(observer: { [weak self] error in
      LoadingHelper.dismiss()
      self?.showError(message: error?.localizedDescription)
    })
  }

  private func showError(message: String?) {
    tableView.isHidden = true
    errorView?.isHidden = false
    errorView?.message = message
  }

  private func hideError() {
    tableView?.isHidden = false
    errorView?.isHidden = true
  }

  private func registerCells() {
    tableView.register(NewsTableViewCell.self)
  }

  override func changeAppLanguage() {
    newsListViewModel?.languageDidChanged()
  }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension MainViewController: UITableViewDataSource, UITableViewDelegate {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return newsListViewModel?.numberOfRowIn(section) ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as NewsTableViewCell
    cell.setupCellWith(news: newsListViewModel?.itemFor(indexPath))
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    newsListViewModel?.didSelectItemAt(indexPath)
    tableView.deselectRow(at: indexPath, animated: false)
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return newsListViewModel?.heightOfRowAt(indexPath) ?? 0.0
  }

}
