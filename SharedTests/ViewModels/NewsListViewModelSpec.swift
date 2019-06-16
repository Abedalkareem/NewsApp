//
//  NewsListViewModelSpec.swift
//  SharedTests
//
//  Created by abedalkareem omreyh on 6/16/19.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import Nimble
import Quick
@testable import Shared

class NewsListViewModelSpec: QuickSpec {
  override func spec() {
    describe("The 'NewsListViewModelSpec'") {
      context("created by valid json array") {
        var newsListViewModel: NewsListViewModel!

        beforeEach {
          LocalNewsServices.getTopHeadlines(complition: { (news, error) in
            newsListViewModel = NewsListViewModel(news: news!)
          })
        }

        afterEach {
          newsListViewModel = nil
        }

        it("to not be empty") {
          expect(newsListViewModel.numberOfRowIn(0)).toNot(equal(0))
        }

        it("to not hava a nil object") {
          expect(newsListViewModel.itemFor(IndexPath(row: 0, section: 0))).toNot(beNil())
        }
      }
    }
  }
}
