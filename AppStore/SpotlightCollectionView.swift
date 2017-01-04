//
//  ContainerCollectionView.swift
//  AppStore
//
//  Created by Jimmy Hoang on 12/31/16.
//  Copyright © 2016 Jimmy Hoang. All rights reserved.
//

import UIKit

class SpotlightCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var spotlightImageArray = ["mario", "miitomo", "clash"]
    var timer: Timer?
    var currentIndex = 0
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
//    
//    func autoSlide() {
//        print(currentIndex)
//        let index = IndexPath(item: self.currentIndex, section: 0)
//        self.currentIndex += 1
//        self.scrollToItem(at: index, at: .left, animated: true)
//    }
    
//    func startTimer() {
//        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(autoSlide), userInfo: nil, repeats: true)
//    }
//    
//    func resetTimer() {
//        timer?.invalidate()
//        startTimer()
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
        registerNib()
    }
    
    func setUp() {
        delegate = self
        dataSource = self
    }
    
    func registerNib() {
        let spoitlightNib = UINib(nibName: NibName.SpotlightCollectionViewCell, bundle: nil)
        self.register(spoitlightNib, forCellWithReuseIdentifier: NibIdentifier.SpotlightCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10000
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = dequeueReusableCell(withReuseIdentifier: "SpotlightCell", for: indexPath) as! SpotlightCollectionViewCell
        cell.setImage(name: spotlightImageArray[indexPath.row % spotlightImageArray.count])
        return cell
    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("touched")
//    }
//
//    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
//        currentIndex += 1
//        resetTimer()
//    }

    var onlyOnce = false
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if !onlyOnce { // 1st time open app, set default index at 5000 so can scroll left & right infinitely
//            currentIndex = 5000
//            startTimer()
            let index = IndexPath(item: 5000, section: 0)
            self.scrollToItem(at: index, at: .left, animated: false)
            onlyOnce = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: 150)
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
