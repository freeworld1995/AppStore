//
//  PhotoViewController.swift
//  AppStore
//
//  Created by Jimmy Hoang on 1/3/17.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var imageData = [Data]()
    var images = [UIImage]()
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.delegate = self
        collectionView.dataSource = self
        addLongPressGesture()
        self.imageData = PhotoData.getData()
        self.getImages()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
    }
    
    func getImages() {
        for data in self.imageData {
            let image = UIImage.resizeImage(image: UIImage(data: data)!, targetSize: CGSize(width: 300, height: 300))
            self.images.append(image)
        }
    }
    
    func addLongPressGesture() {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        self.collectionView.addGestureRecognizer(longPressGesture)
    }
    
    func handleLongPress(gesture: UILongPressGestureRecognizer) {
        switch gesture.state {
        case .began:
            guard let selectedIndexPath = collectionView.indexPathForItem(at: gesture.location(in: self.collectionView)) else { break }
            collectionView.beginInteractiveMovementForItem(at: selectedIndexPath)
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: self.collectionView))
        case .ended:
            collectionView.endInteractiveMovement()
        default:
            collectionView.cancelInteractiveMovement()
        }
    }

    func registerNib() {
        let photoCellNib = UINib(nibName: "PhotoCollectionViewCell", bundle: nil)
        collectionView.register(photoCellNib, forCellWithReuseIdentifier: "PhotoCell")
    }
    
}

extension PhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCollectionViewCell
        cell.layer.shouldRasterize  = true
        cell.layer.rasterizationScale = UIScreen.main.scale
        
        DispatchQueue.global().async { [unowned self] in
            //            let data = self.imageData[indexPath.item]
            //            let image = UIImage(data: data)
            let image = self.images[indexPath.row]
            DispatchQueue.main.async {
                cell.imageView.image = image
                
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let temp = images.remove(at: sourceIndexPath.item)
        images.insert(temp, at: destinationIndexPath.item)
    }
    
}
