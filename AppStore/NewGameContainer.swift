//
//  ContainerCollectionViewCell.swift
//  AppStore
//
//  Created by Jimmy Hoang on 12/30/16.
//  Copyright © 2016 Jimmy Hoang. All rights reserved.
//

import UIKit

class NewGameContainer: UICollectionViewCell{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 40))
        self.contentView.addSubview(view)
        
        let label: UILabel = {
            let lbl = UILabel(frame: CGRect(x: 8, y: 0, width: view.frame.width / 2, height: view.frame.height))
            lbl.font = UIFont(name: "HelveticaNeue", size: 13)
            lbl.text = "New Games We Love"
            return lbl
        }()
        
        let button: UIButton = {
            let button = UIButton(frame: CGRect(x: view.frame.width * 0.75, y: 0, width: 90, height: view.frame.height))
            button.setTitle("See All >", for: .normal)
            button.setTitleColor(UIColor.gray, for: .normal)
            button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 11)
            return button
        }()
        
        let dividerLine: UIView = {
            let view = UIView(frame: CGRect(x: 16, y: self.frame.height + 14, width: self.frame.width, height: 0.5))
            view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
            return view
        }()
        
        view.addSubview(label)
        view.addSubview(button)
        view.addSubview(dividerLine)
    }
    
}
