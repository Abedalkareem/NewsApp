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
        var viewModel: NewsListViewModel!
        
        beforeEach {
          let newsServices = NewsServices(dataManager: DataManager(networking: LocalData()))
          viewModel = NewsListViewModel(newsServices: newsServices)
          viewModel.getTopHeadlines()
        }
        
        afterEach {
          viewModel = nil
        }
        
        it("to not be empty") {
          expect(viewModel.numberOfRowIn(0)).toNot(equal(0))
        }
        
        it("to not hava a nil object") {
          expect(viewModel.itemFor(IndexPath(row: 0, section: 0))).toNot(beNil())
        }
      }
    }
  }
}
