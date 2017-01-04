//
//  AppCollectionViewCell.swift
//  AppStore
//
//  Created by Jimmy Hoang on 1/1/17.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class NewGameCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var appIcon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setAppIcon(imageName: String) {
        appIcon.image = UIImage(named: imageName)
    }
    
    func setLabel(title: String, category: String, price: String) {
        self.title.text = title
        self.category.text = category
        self.price.text = price
    }
}
