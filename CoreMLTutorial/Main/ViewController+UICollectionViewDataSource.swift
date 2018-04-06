//
//  ViewController+UICollectionViewDataSource.swift
//  CoreMLTutorial
//
//  Created by Melvin John on 06/04/2018.
//  Copyright © 2018 Melvin John. All rights reserved.
//

import UIKit

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
        
        let photo = photos[indexPath.row]
        
        photoCell.imageView.image = photo
        
        return photoCell
    }
}
