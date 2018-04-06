//
//  ViewController+UICollectionViewDelegateFlowLayout.swift
//  CoreMLTutorial
//
//  Created by Melvin John on 06/04/2018.
//  Copyright © 2018 Melvin John. All rights reserved.
//

import UIKit

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
