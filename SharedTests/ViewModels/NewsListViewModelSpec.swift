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

  private var newsServices: NewsServices {
      NewsServices(dataManager: DataManager(networking: LocalData()))
  }

  private var zeroIndexPath: IndexPath {
    IndexPath(row: 0, section: 0)
  }

  override func spec() {
    describe("A 'NewsListViewModel'") {
      context("with a valid data") {
        var viewModel: NewsListViewModel!

        beforeEach {
          viewModel = NewsListViewModel(newsServices: self.newsServices)
          viewModel.getTopHeadlines()
        }

        afterEach {
          viewModel = nil
        }

        it("to not be empty") {
          expect(viewModel.numberOfRowIn(0)) != 0
        }

        it("to not hava a nil object") {
          expect(viewModel.itemFor(self.zeroIndexPath)).toNot(beNil())
        }

        it("height should be 100") {
          expect(viewModel.heightOfRowAt(self.zeroIndexPath)) == 100
        }
      }

      context("with a delegate") {
        var viewModel: NewsListViewModel!
        var mockDelegate: NewsViewModelDelegateMock!

        beforeEach {
          viewModel = NewsListViewModel(newsServices: self.newsServices)
          mockDelegate = NewsViewModelDelegateMock()
          viewModel.coordinatorDelegate = mockDelegate
        }

        afterEach {
          viewModel = nil
        }

        context("when an item selected") {
          it("open method in delegate should get called when there is a valid data") {
            viewModel.getTopHeadlines()
            viewModel.didSelectItemAt(self.zeroIndexPath)
            expect(mockDelegate.openGotCalled) == true
          }

          it("open method in delegate should not get called when there is no data") {
            viewModel.didSelectItemAt(self.zeroIndexPath)
            expect(mockDelegate.openGotCalled) == false
          }
        }

        context("when an change language pressed") {
          it("languageDidChanged method in delegate should get called") {
            viewModel.languageDidChanged()
            expect(mockDelegate.languageDidChangedGotCalled) == true
          }
        }
      }
    }
  }

}
