//
//  CategoryCollectionViewCell.swift
//  NewsApp
//


import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var namesLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 10
        imgView.alpha = 0.6
       // containerView.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner]
        
    }

}
