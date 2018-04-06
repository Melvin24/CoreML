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
    
    lazy var photos: [UIImage] = [#imageLiteral(resourceName: "supraImage"), #imageLiteral(resourceName: "carrotCakeImage"), #imageLiteral(resourceName: "cheetahImage"), #imageLiteral(resourceName: "suvImage"), #imageLiteral(resourceName: "tigerImage"), #imageLiteral(resourceName: "dogImage")]
    
    @IBOutlet var collectionView: UICollectionView!
    
}
