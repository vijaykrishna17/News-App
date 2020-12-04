//
//  Common.swift
//  NewsApp
//

import Foundation
import ARKit

extension UIViewController {
    func showAlert(str:String,title:String=""){
        let alert = UIAlertController(title: title, message: str, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
}

    

