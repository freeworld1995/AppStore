//
//  Font.swift
//  AppStore
//
//  Created by Jimmy Hoang on 1/4/17.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class Font: NSObject {
    var name: String?
    var style: [String]?
    
    init(name: String, style: [String]) {
        self.name = name
        self.style = style
    }
    
    override init() {
    }
}
