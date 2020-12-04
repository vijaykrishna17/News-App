//
//  NetworkingHandler.swift
//  NewsApp
//

//

import Foundation
import ARKit


class NetworkHandler {
    
    typealias  completionHandler  = (NewsModals) -> ()
    
    
    func sendGetRequestType(url : String , complitionHandler : @escaping completionHandler ){
        if let unWrapUrl = URL(string: url){
            let session = URLSession.shared
            session.dataTask(with: unWrapUrl, completionHandler: { (data ,responce , error) in
                if data != nil , responce != nil , error == nil {
                    let jsonDecoder = JSONDecoder()
                    guard let newsData = try? jsonDecoder.decode(NewsModals.self, from: data!) else {
                        return
                    }
                    if newsData.status == "ok"{
                        
                        complitionHandler(newsData)
                        
                    }
                    
                }
            }).resume()
            
        }
    }
}
