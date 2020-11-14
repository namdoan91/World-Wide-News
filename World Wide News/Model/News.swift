//
//  News.swift
//  World Wide News
//
//  Created by namit on 11/14/20.
//

import Foundation
import SwiftyJSON

class News{
    var status: String?
    var totalResult: String?
    var articles: [Articles]?
    
    required public init? (json: JSON){
        status = json["status"].stringValue
        totalResult = json["totalResult"].stringValue
        articles = json["articles"].map{Articles(json: JSON($0))!}
    }
}
class Articles{
    var source: [Source]?
    var author: [Author]?
    var title: String?
    var articleDescription: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
    required public init?(json: JSON){
        source = json["source"].map{Source(json: JSON($0))!}
        author = json["author"].map{Author(json: JSON($0))!}
        title = json["title"].stringValue
        articleDescription = json["articleDescription"].stringValue
        url = json["url"].stringValue
        urlToImage = json["urlToImage"].stringValue
        publishedAt = json["publishedAt"].stringValue
        content = json["content"].stringValue
    }
}
class Source{
    var id: String?
    var author: String?
    
    required public init?(json: JSON){
        id = json["id"].stringValue
        author = json["author"].stringValue
    }
}
class Author {
    var author: String?
    required public init?(json: JSON){
        author = json["author"].stringValue
    }
}
