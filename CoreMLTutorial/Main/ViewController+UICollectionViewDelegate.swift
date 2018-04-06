//
//  ViewController+UICollectionViewDelegate.swift
//  CoreMLTutorial
//
//  Created by Melvin John on 06/04/2018.
//  Copyright © 2018 Melvin John. All rights reserved.
//

import UIKit

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let viewController = UIStoryboard(name: "DetailedPhotoViewController", bundle: .main).instantiateInitialViewController() as? DetailedPhotoViewController else {
            return
        }
        
        viewController.photo = photos[indexPath.row]
        
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
}
