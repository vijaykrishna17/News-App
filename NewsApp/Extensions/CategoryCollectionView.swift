//
//  CategoryCollectionView.swift
//  NewsApp
//

//

import Foundation
import ARKit
import SDWebImage

extension  NewsViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  newsViewModal.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoryTableViewCell
        let newsModal = newsViewModal.cellForRowAtIndexPath(index: indexPath.row)
        cell.articleTitleLbl.text = newsModal.title
        cell.articleDescriptionLbl.text = newsModal.articleDescription
        cell.articleimgView.setShowActivityIndicator(true)
        cell.articleimgView.setIndicatorStyle(UIActivityIndicatorView.Style.large)
        cell.articleimgView.sd_setImage(with: URL(string: newsModal.urlToImage), placeholderImage: #imageLiteral(resourceName: "defaultimg"))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsModal = newsViewModal.cellForRowAtIndexPath(index: indexPath.row)
        
        let vc = (storyboard?.instantiateViewController(identifier: "WebView"))! as WebViewController
        vc.webUrlString = newsModal.url
        print(newsModal.url)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension NewsViewController : UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoryCollectionViewCell
        cell.imgView.image = UIImage(named: imagesArray[indexPath.row])
        cell.namesLbl.text = nameArr[indexPath.row]
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize:CGSize = CGSize(width: 180, height: 70)
        return cellSize
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top:8, left:CGFloat(8), bottom:8, right:CGFloat(8))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // let categary = apiUrls[indexPath.row]
        
        
        if apiUrls[indexPath.row] == "business" {
            
            if Connectivity.isConnectedToInterNet() {
                let url =  apiUrl.urlString + apiUrl.business + apiUrl.apiKey
                newsViewModal.getNewsDataFromApiHandler(url: url ) {  (newsListData) in
                    DispatchQueue.main.async {
                        self.newsTableView.reloadData()
                        
                    }
                    
                }
                
            }else{
                showAlert(str: "The Internet connection appears to be offline.")
            }
            
            
        }else if apiUrls[indexPath.row] == "entertainment"{
            if Connectivity.isConnectedToInterNet() {
                let url =  apiUrl.urlString + apiUrl.entertainment + apiUrl.apiKey
                newsViewModal.getNewsDataFromApiHandler(url: url ) {  (newsListData) in
                    DispatchQueue.main.async {
                        self.newsTableView.reloadData()
                        // newsTableView.indexPath.row = 0
                    }
                    
                }
            }else{
                showAlert(str: "The Internet connection appears to be offline.")
            }
            
            
            
        }else if apiUrls[indexPath.row] == "general"{
            if Connectivity.isConnectedToInterNet() {
                let url = apiUrl.urlString + apiUrl.general + apiUrl.apiKey
                newsViewModal.getNewsDataFromApiHandler(url: url ) {  (newsListData) in
                    DispatchQueue.main.async {
                        self.newsTableView.reloadData()
                    }
                    
                }
                
            }else{
                showAlert(str: "The Internet connection appears to be offline.")
            }
            
            
        }else if apiUrls[indexPath.row] == "health"{
            if Connectivity.isConnectedToInterNet() {
                let url = apiUrl.urlString + apiUrl.health + apiUrl.apiKey
                newsViewModal.getNewsDataFromApiHandler(url: url ) {  (newsListData) in
                    DispatchQueue.main.async {
                        self.newsTableView.reloadData()
                    }
                    
                }
                
            }else{
                showAlert(str: "The Internet connection appears to be offline.")
            }
            
            
        }else if apiUrls[indexPath.row] == "science"{
            if Connectivity.isConnectedToInterNet() {
                let url =  apiUrl.urlString + apiUrl.science + apiUrl.apiKey
                newsViewModal.getNewsDataFromApiHandler(url: url ) {  (newsListData) in
                    DispatchQueue.main.async {
                        self.newsTableView.reloadData()
                    }
                    
                }
            }else{
                showAlert(str: "The Internet connection appears to be offline.")
            }
            
            
        }else if apiUrls[indexPath.row] == "sports"{
            if Connectivity.isConnectedToInterNet() {
                let url =  apiUrl.urlString + apiUrl.sports + apiUrl.apiKey
                newsViewModal.getNewsDataFromApiHandler(url: url ) {  (newsListData) in
                    DispatchQueue.main.async {
                        self.newsTableView.reloadData()
                    }
                    
                }
                
                
            }else{
                showAlert(str: "The Internet connection appears to be offline.")
            }
            
            
        }else if apiUrls[indexPath.row] == "technology"{
            if Connectivity.isConnectedToInterNet() {
                
                let url = apiUrl.urlString + apiUrl.technology + apiUrl.apiKey
                newsViewModal.getNewsDataFromApiHandler(url: url ) {  (newsListData) in
                    DispatchQueue.main.async {
                        self.newsTableView.reloadData()
                    }
                    
                }
                
            }else{
                showAlert(str: "The Internet connection appears to be offline.")
            }
            
        }
    }
}

