//
//  NewsViewModelSpec.swift
//  SharedTests
//
//  Created by abedalkareem omreyh on 08/09/2022.
//  Copyright © 2022 abedalkareem. All rights reserved.
//

import Nimble
import Quick
@testable import Shared

class NewsViewModelSpec: QuickSpec {

  override func spec() {
    describe("A 'NewsViewModel'") {
      context("with a valid News model") {

        it("property of news to be same as property for view model") {
          let news = self.news(isAuthorNil: false)
          let viewModel = NewsViewModel(news: news)
          expect(viewModel.title) == news.title
          expect(viewModel.description) == news.description
          expect(viewModel.url) == news.url
          expect(viewModel.urlToImage) == news.urlToImage
          expect(viewModel.publishedAt) == news.publishedAt
          expect(viewModel.content) == news.content
          expect(viewModel.author) == news.author
          expect(viewModel.sourceID) == news.source?.id
          expect(viewModel.sourceName) == news.source?.name
        }

        it("when new author is null then author will be the source name") {
          let news = self.news(isAuthorNil: true)
          let viewModel = NewsViewModel(news: news)
          expect(viewModel.author) == news.source?.name
        }
      }
    }
  }

  private func news(isAuthorNil: Bool) -> News {
    return News(title: "title",
                description: "description",
                url: "url",
                urlToImage: "urlToImage",
                publishedAt: "publishedAt",
                content: "content",
                author: isAuthorNil ? nil : "auther",
                source: Source(id: "id", name: "name"))
  }

}
