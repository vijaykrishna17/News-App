//
//  NewesViewModal.swift
//  NewsApp


import Foundation
import ARKit

class NewsViewModal {
    
    typealias  complitionHandler = (NewsModals) -> ()
    
    var newsArticles = [Article]()
    let networkinModal = NetworkHandler()
    
    func getNewsDataFromApiHandler(url : String , complitionHandler : @escaping complitionHandler) {
        networkinModal.sendGetRequestType(url: url) { newsArrData in
            self.newsArticles = newsArrData.articles
            
            for newsData in newsArrData.articles
            {
                self.newsArticles.append(newsData)
                complitionHandler(newsArrData)
            }
            
        }
    }
    
    func numberOfRowsInSection() -> Int{
        return newsArticles.count
    }
    
    func cellForRowAtIndexPath(index : Int) -> Article {
        let indexNewsData = newsArticles[index]
        
        return indexNewsData
    }
}
