//
//  MainViewController.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 11/4/18.
//  Copyright © 2018 abedalkareem. All rights reserved.
//

import UIKit
import Shared

class MainViewController: BaseViewController {
  
  
  // MARK: - IBOutlets

  @IBOutlet weak var tableView: UITableView!

  // MARK: - Parameters

  var newsListViewModel: NewsListViewModel?
  
  
  // MARK: - ViewController lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "main_title_top_headlins".localiz()
    
    registerCells()
    addChangeLanguageButton()
    observeForChanges()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    getNews()
  }
  
  private func getNews() {
    LoadingHelper.show()
    newsListViewModel?.getTopHeadlines()
  }

  private func observeForChanges() {
    newsListViewModel?.news?.bind(observer: { [weak self] _ in
      LoadingHelper.dismiss()
      self?.tableView.reloadData()
    })
    newsListViewModel?.error?.bind(observer: { [weak self] _ in
      LoadingHelper.dismiss()
      self?.tableView.isHidden = true
      // TODO: Show the error
    })
  }
  
  private func registerCells() {
    tableView.register(NewsTableViewCell.self)
  }
  
  override func changeAppLanguage() {
    newsListViewModel?.languageDidChanged()
  }
  
}


extension MainViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return newsListViewModel?.numberOfRowIn(section) ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as NewsTableViewCell
    cell.setupCellWith(news: newsListViewModel!.itemFor(indexPath))
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
