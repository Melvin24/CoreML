//
//  ViewController.swift
//  CoreML
//
//  Created by Melvin John on 06/04/2018.
//  Copyright © 2018 Melvin John. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var layoutHelper = LayoutHelper()
    
    lazy var photos: [UIImage] = {
        return [#imageLiteral(resourceName: "supraImage"), #imageLiteral(resourceName: "carrotCakeImage"), #imageLiteral(resourceName: "cheetahImage")]
    }()
    
    @IBOutlet var collectionView: UICollectionView!
    
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let viewController = UIStoryboard(name: "DetailedPhotoViewController", bundle: .main).instantiateInitialViewController() as? DetailedPhotoViewController else {
            return
        }
        
        viewController.photo = photos[indexPath.row]
        
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
}

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

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    /// Asks the delegate for the spacing between successive items in the rows or columns of a section.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    /// Asks the delegate for the spacing between successive rows or columns of a section.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return layoutHelper.interItemSpacing
    }
    
    /// Asks the delegate for the margins to apply to content in the specified section.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return layoutHelper.sectionInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let maxContentWidth = view.frame.width
        
        let availableContentWidth = maxContentWidth - (layoutHelper.sectionInset.left + layoutHelper.sectionInset.right + layoutHelper.interItemSpacing)
        
        guard availableContentWidth > 0 else {
            return .zero
        }
        
        let itemsPerRow = UIDevice.current.orientation.isLandscape ? layoutHelper.numberOfItemsPerRowLandscape : layoutHelper.numberOfItemsPerRowPortrait
        
        let maxWidthAndHeightPerItem = availableContentWidth/itemsPerRow
        
        return CGSize(width: maxWidthAndHeightPerItem, height: maxWidthAndHeightPerItem)
        
    }
    
}

