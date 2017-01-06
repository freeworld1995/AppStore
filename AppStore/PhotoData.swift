//
//  PhotoData.swift
//  AppStore
//
//  Created by Jimmy Hoang on 1/3/17.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class PhotoData {
    
    var images = [UIImage]()
    
    static func getData() -> [Data] {
        var imageUrl = [String]()
        var data = [Data]()
        
        if let path = Bundle.main.resourcePath?.appending("/Images/") {
            imageUrl = try! FileManager.default.contentsOfDirectory(atPath: path)
            for url in imageUrl {
                let d = FileManager.default.contents(atPath: path.appending(url))
                
                data.append(d!)
            }
        }
        return data
    }
    
    func getImages() {
        var imageUrl = [String]()
        
        if let path = Bundle.main.resourcePath?.appending("/Images/") {
            imageUrl = try! FileManager.default.contentsOfDirectory(atPath: path)
            for url in imageUrl {
                let d = FileManager.default.contents(atPath: path.appending(url))
                
                let image = UIImage(data: d!)
                images.append(image!)
            }
        }
        print(images.count)
    }
    
    func getImageBy(index: Int) -> UIImage{
        return images[index]
    }
    
//    init() {
//        getImages()
//    }
}
