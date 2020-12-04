//
//  WebViewController.swift
//  NewsApp
//

//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet weak var articleWebView: WKWebView!
    var webUrlString : String?
    var back = false
    
    @IBOutlet weak var actvityIncater: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: webUrlString!)
        let request = URLRequest(url: url!)
       
        articleWebView.addSubview(actvityIncater)
        actvityIncater.startAnimating()
         articleWebView.load(request)
        articleWebView.navigationDelegate = self
        actvityIncater.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        articleWebView.clipsToBounds = true
        articleWebView.layer.cornerRadius = 15
        articleWebView.layer.maskedCorners =  [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner]
    }
    
    
    @IBAction func backBtn(_ sender: UIButton) {
       // let vc = (storyboard?.instantiateViewController(identifier: "NewsView"))! as NewsViewController
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
}

extension WebViewController : WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        actvityIncater.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        actvityIncater.stopAnimating()
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        actvityIncater.stopAnimating()
    }
    
}
