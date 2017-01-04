//
//  Utils.swift
//  AppStore
//
//  Created by Jimmy Hoang on 1/1/17.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

extension UIColor {
    static func getRandomColor() -> UIColor{
        
        let randomRed:CGFloat = CGFloat(drand48())
        
        let randomGreen:CGFloat = CGFloat(drand48())
        
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
}

extension Double {
    var toString: String {return String(self) }
}

extension CGSize {
    func add(dx: CGFloat, dy: CGFloat) -> CGSize {
        return CGSize(width: self.width + dx, height: self.height + dy)
    }
}

extension CGPoint {
    func add(dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: self.x + dx, y: self.y + dy)
    }
}
