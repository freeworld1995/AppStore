//
//  AppCollectionView.swift
//  AppStore
//
//  Created by Jimmy Hoang on 1/1/17.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class NewGameCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var appData: [App]?  
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
        registerNib()
        
    }
    
    func setUp() {
        delegate = self
        dataSource = self
        appData = App.createData()
    }
    
    func registerNib() {
        let app = UINib(nibName: NibName.NewGameCell, bundle: nil)
        self.register(app, forCellWithReuseIdentifier: NibIdentifier.NewGameCell)
//        let headerNib = UINib(nibName: NibName.HeaderCell, bundle: nil)
//        self.register(headerNib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: NibIdentifier.HeaderCell)
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard appData?.count != 0 else {return 0}
        return appData!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: NibIdentifier.NewGameCell, for: indexPath) as! NewGameCollectionViewCell
        let app = appData![indexPath.row]
        cell.setAppIcon(imageName: app.imageName!)
        cell.setLabel(title: app.name!, category: app.category!, price: app.price!.toString)
//        cell.backgroundColor = UIColor.getRandomColor()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: self.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 72, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header = dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: NibIdentifier.HeaderCell, for: indexPath) as! HeaderCollectionReusableView
//        header.setUp(HeaderText: "New Game We Love", buttonText: "See All >")
//        return header
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: 150, height: 50)
//    }

}

