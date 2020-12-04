//
//  NewsViewController.swift
//  NewsApp
//

//

import UIKit
import SDWebImage


class NewsViewController : UIViewController {
    @IBOutlet weak var tittleView: UILabel!
    @IBOutlet weak var categoryView: UIView!
    
    let apiUrl = EndPoints()
    let webView = WebViewController()
    
    
    
    @IBOutlet weak var newsTableView: UITableView!
    
    let imagesArray = ["bussinessImg","entertaiment","general","healthImg","science","sports","technology"]
    let nameArr = ["bussiness","entertaiment","general","health","science","sports","technology"]
    let apiUrls =
        ["business" ,"entertainment", "general", "health", "science", "sports", "technology"]
    var newsViewModal = NewsViewModal()
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = apiUrl.urlString + apiUrl.source + apiUrl.apiKey
        categoryCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil),forCellWithReuseIdentifier: "cell")
        newsTableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        newsTableView.delegate = self
        newsTableView.dataSource = self
        
        if Connectivity.isConnectedToInterNet() {
            newsViewModal.getNewsDataFromApiHandler(url: url ) {  (newsListData) in
                DispatchQueue.main.async {
                    self.newsTableView.reloadData()
                    
                }
            }
        }else{
            showAlert(str: "The Internet connection appears to be offline.", title: "Alert")
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        categoryView.clipsToBounds = true
        categoryView.layer.cornerRadius = 10.0
        categoryView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    }
    
}
