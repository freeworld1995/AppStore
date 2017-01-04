//
//  PhotoViewController.swift
//  AppStore
//
//  Created by Jimmy Hoang on 1/3/17.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var imageData = [Data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        imageData = PhotoData.getData()
        registerNib()
    }
    
    func registerNib() {
        let photoCellNib = UINib(nibName: "PhotoCollectionViewCell", bundle: nil)
        collectionView.register(photoCellNib, forCellWithReuseIdentifier: "PhotoCell")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCollectionViewCell
        cell.imageView.image = UIImage(data: self.imageData[indexPath.item])
        
        return cell
    }
    
}
