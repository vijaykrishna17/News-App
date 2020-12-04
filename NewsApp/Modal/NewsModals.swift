//
//  NewsModals.swift
//  NewsApp
//

//

import Foundation



class NewsModals : Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]

    init(status: String, totalResults: Int, articles: [Article]) {
        self.status = status
        self.totalResults = totalResults
        self.articles = articles
    }
}

// MARK: - Article
class Article: Codable {
    let source : Source
    let author: String
    var title, articleDescription: String
    let url: String
    var urlToImage: String
    let publishedAt: String
    let content: String
    
    init(author : String ,title:String,articleDescription:String,url:String,urlToImage:String,publishedAt:String,content:String,source:Source) {
        self.source = source
        self.title = title
        self.author = author
        self.articleDescription = articleDescription
        self.url = url
        self.publishedAt = publishedAt
        self.content = content
        self.urlToImage = urlToImage
    }

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
    
    enum codingKeys: String, CodingKey {
           case source, author, title
           case articleDescription = "description"
           case url, urlToImage, publishedAt, content
       }
    
    
    
    func encoder(from encode : Encoder) throws {
        var container = encode.container(keyedBy: codingKeys.self)
        try container.encode(author, forKey: .author)
        try container.encode(source, forKey: .source)
        try container.encode(title, forKey: .title)
        try container.encode(articleDescription, forKey: .articleDescription)
        try container.encode(url, forKey: .url)
        try container.encode(urlToImage, forKey: .urlToImage)
        try container.encode(publishedAt, forKey: .publishedAt)
        try container.encode(content, forKey: .content)
        
    }


    
    required init(from decoder : Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self )
        self.author = try container.decodeIfPresent(String.self, forKey: .author) ?? ""
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.articleDescription = try container.decodeIfPresent(String.self, forKey: .articleDescription) ?? ""
        self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
        self.urlToImage  = try container.decodeIfPresent(String.self, forKey: .urlToImage) ?? ""
        self.publishedAt = try container.decodeIfPresent(String.self, forKey: .publishedAt) ?? ""
        self.content = try container.decodeIfPresent(String.self, forKey: .content) ?? ""
        self.source = try container.decodeIfPresent(Source.self, forKey: .source)!
    }
}

// MARK: - Source
class Source: Codable {
    let id: String?
    let name: String
    
    enum CodeingKeys : String ,CodingKey {
        case name = "Name"
        case id  = "Id"
    }
    enum codeingKeys : String ,CodingKey {
           case name = "name"
           case id = "id"
       }


    func encoder(from encoder:Encoder) throws{
        var container =  encoder.container(keyedBy: codeingKeys.self)
        try container.encode(id, forKey:.id)
        try container.encode(name, forKey: .name)
    }
    
    required init(from decoder : Decoder) throws{
         let container = try decoder.container(keyedBy: CodeingKeys.self )
        self.id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
    }
    
}
