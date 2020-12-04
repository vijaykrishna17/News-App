//
//  UrlClass.swift
//  NewsApp
//

import Foundation

 class EndPoints {
    
    
    let apiUrls = ["business" ,"entertainment", "general", "health", "science", "sports", "technology"]
    
    let source = "/top-headlines?country=us"
    let apiKey = "&apiKey=fbedb3ac5f414c908dd0b8d081e7f3ae"
    let urlString = "https://newsapi.org/v2"
    
    let health =  "/everything?q=health"
    let sports = "/everything?q=sports"
    let entertainment = "/everything?q=entertainment"
    let business = "/everything?q=business"
    let science = "/everything?q=science"
    let technology = "/everything?q=technology"
    let general = "/everything?q=general"
   
    
//    func apiUrlString( url : String){
//
//        let url = urlString + source + apiKey
//        print(url)
//    }
    
}
