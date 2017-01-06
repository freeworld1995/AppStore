//
//  PhotoLayout.swift
//  AppStore
//
//  Created by Jimmy Hoang on 1/3/17.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class PhotoLayout: UICollectionViewLayout {
    var contentWidth: CGFloat = 0.0
    var contentHeight: CGFloat = 0.0
    var squareCellLength: CGFloat = 0.0
    var cache = [UICollectionViewLayoutAttributes]()

    override func prepare() {
        contentWidth = collectionView!.frame.width
        
        // get number of items from the data source of collectionView
        let numberOfItems = Double(collectionView!.dataSource!.collectionView(collectionView!, numberOfItemsInSection: 0))
        
        /**  eg:
         12 items => 12 % 2 = 0 => contentRow = 6
         9 items => 9 % 2 != 0 => contentRow = ceil(4.5) = 5
         */
        let contentRow = numberOfItems.truncatingRemainder(dividingBy: 2) == 0 ? numberOfItems / 2 : ceil(numberOfItems / 2)
        squareCellLength = contentWidth / 3
        contentHeight = CGFloat(contentRow) * squareCellLength + squareCellLength
        
        for itemIndex in 0 ..< Int(numberOfItems) {
            let attribute = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: itemIndex, section: 0))
            var size = CGSize(width: squareCellLength, height: squareCellLength)
            var origin = CGPoint(x: 0, y: CGFloat(itemIndex / 6) * contentWidth)
            
            switch itemIndex % 12 {
            case 0:
                size = size.add(dx: squareCellLength, dy: squareCellLength)
            case 1, 2:
                origin = origin.add(dx: squareCellLength * 2, dy: CGFloat(itemIndex % 12 - 1) * squareCellLength)
            case 3, 4, 5:
                origin = origin.add(dx: CGFloat(itemIndex % 12 - 3) * squareCellLength, dy: squareCellLength * 2)
            case 6, 7:
                origin = origin.add(dx: 0, dy: CGFloat(itemIndex % 12 - 6) * squareCellLength)
            case 8:
                size = size.add(dx: squareCellLength, dy: squareCellLength)
                origin = origin.add(dx: squareCellLength, dy: 0)
            default:
                origin = origin.add(dx: CGFloat(itemIndex % 12 - 9) * squareCellLength, dy: squareCellLength * 2)
            }
            
            attribute.frame = CGRect(origin: origin, size: size)
            cache.append(attribute)
        }
        
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributeInRect = [UICollectionViewLayoutAttributes]()
        cache.forEach {
            if rect.intersects($0.frame) {
                attributeInRect.append($0)
            }
        }   
        return attributeInRect
    }
    
}
