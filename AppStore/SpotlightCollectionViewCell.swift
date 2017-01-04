//
//  SpotlightCollectionViewCell.swift
//  AppStore
//
//  Created by Jimmy Hoang on 12/30/16.
//  Copyright © 2016 Jimmy Hoang. All rights reserved.
//

import UIKit

class SpotlightCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setImage(name: String) {
        image.image = UIImage(named: name)
    }

}
