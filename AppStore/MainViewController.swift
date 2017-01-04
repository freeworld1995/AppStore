//
//  SpotlightViewController.swift
//  AppStore
//
//  Created by Jimmy Hoang on 12/30/16.
//  Copyright © 2016 Jimmy Hoang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController{

    let spotlightImageArray = ["mario", "miitomo"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
//        collectionView.register(ContainerCollectionViewCell.self, forCellWithReuseIdentifier: "ContainerCell")
    }
    
//    override func viewWillLayoutSubviews() {
//        self.spotlightCollectionView.collectionViewLayout.invalidateLayout()
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let index = indexPath.row
        
        switch index {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SpotlightContainer", for: indexPath)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewGameContainer", for: indexPath)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewGameContainer", for: indexPath)
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LimitedTimeContainer", for: indexPath)
            return cell
        default:
            break
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GetTogetherContainer", for: indexPath)
        return cell
    }
    

}

extension MainViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
