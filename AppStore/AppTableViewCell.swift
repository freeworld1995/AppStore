//
//  AppTableViewCell.swift
//  AppStore
//
//  Created by Jimmy Hoang on 12/30/16.
//  Copyright © 2016 Jimmy Hoang. All rights reserved.
//

import UIKit

class AppTableViewCell: UITableViewCell {

    @IBOutlet weak var appIcon: UIButton!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setAppIcon(imageName: String) {
        let image = UIImage(named: imageName)
        appIcon.setImage(image, for: .normal)
    }
    
    func setLabel(title: String, category: String, price: String) {
        self.title.text = title
        self.category.text = category
        self.price.text = price
    }
    
    
    
}
