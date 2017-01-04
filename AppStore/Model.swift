//
//  File.swift
//  AppStore
//
//  Created by Jimmy Hoang on 1/4/17.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class Model {
    var fonts = [Font]()
    
    func getFonts() {
        let fontNames = UIFont.familyNames
        
        for name in fontNames {
            let fontStyles = UIFont.fontNames(forFamilyName: name)
            let font = Font(name: name, style: fontStyles)
            fonts.append(font)
        }
    }
    
    init() {
    }
}
