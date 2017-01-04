//
//  HeaderCollectionReusableView.swift
//  AppStore
//
//  Created by Jimmy Hoang on 1/2/17.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var seeAllButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    
    func setUp(HeaderText: String, buttonText: String) {
        headerTitle.text = HeaderText
        seeAllButton.setTitle(buttonText, for: .normal)
    }
    
}
