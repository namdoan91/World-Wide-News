//
//  New.swift
//  World Wide News
//
//  Created by namit on 11/14/20.
//

import Foundation
// MARK: - News
struct New: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case totalResults = "totalResults"
        case articles = "articles"
    }
    
    public init(status: String, totalResults: Int, articles: [Article]) {
        self.status = status
        self.totalResults = totalResults
        self.articles = articles
    }
}

// MARK: - Article
struct Article: Codable {
    let source: Source
    let author: Author
    let title: String
    let articleDescription: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String?
    
    enum CodingKeys: String, CodingKey {
        case source = "source"
        case author = "author"
        case title = "title"
        case articleDescription = "description"
        case url = "url"
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
        case content = "content"
    }
    
    init(source: Source, author: Author, title: String, articleDescription: String, url: String, urlToImage: String, publishedAt: String, content: String?) {
        self.source = source
        self.author = author
        self.title = title
        self.articleDescription = articleDescription
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
}

enum Author: String, Codable {
    case bbcNews = "BBC News"
    case cbcNews = "CBC News"
    case foxNews = "Fox News"
}

// MARK: - Source
struct Source: Codable {
    let id: ID
    let name: Author
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    init(id: ID, name: Author) {
        self.id = id
        self.name = name
    }
}

enum ID: String, Codable {
    case bbcNews = "bbc-news"
    case cbcNews = "cbc-news"
    case foxNews = "fox-news"
}
