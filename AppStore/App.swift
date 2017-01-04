//
//  App.swift
//  AppStore
//
//  Created by Jimmy Hoang on 1/4/17.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit


class App: NSObject {
    var imageName: String?
    var name: String?
    var category: String?
    var price: Double?
    
    static func createData() -> [App] {
        let duolingo = App()
        duolingo.imageName = "duolingo"
        duolingo.name = "Duolingo"
        duolingo.category = "Education"
        duolingo.price = 4.99
        
        let pocket = App()
        pocket.imageName = "pocket"
        pocket.name = "Pocket"
        pocket.category = "Productivity"
        pocket.price = 0.99
        
        let airbnb = App()
        airbnb.imageName = "airbnb"
        airbnb.name = "Airbnb"
        airbnb.category = "Traveling"
        airbnb.price = 0.99
        
        let duolingo2 = App()
        duolingo2.imageName = "duolingo"
        duolingo2.name = "Duolingo"
        duolingo2.category = "Education"
        duolingo2.price = 4.99
        
        let pocket2 = App()
        pocket2.imageName = "pocket"
        pocket2.name = "Pocket"
        pocket2.category = "Productivity"
        pocket2.price = 0.99
        
        let airbnb2 = App()
        airbnb2.imageName = "airbnb"
        airbnb2.name = "Airbnb"
        airbnb2.category = "Traveling"
        airbnb2.price = 0.99
        
        return [duolingo, pocket, airbnb, duolingo2, pocket2, airbnb2]
    }
}
