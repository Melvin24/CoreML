//
//  DetailedPhotoViewController.swift
//  CoreMLTutorial
//
//  Created by John, Melvin (Associate Software Developer) on 27/12/2017.
//  Copyright © 2017 John, Melvin (Associate Software Developer). All rights reserved.
//

import UIKit

class DetailedPhotoViewController: UIViewController {

    var photo: UIImage!
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var classificationLabel: UILabel!
    @IBOutlet var confidenceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.image = photo
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let weakSelf = self else {
                return
            }
            
            guard let pixelBuffer = weakSelf.photo.pixelBuffer() else {
                return
            }
            
            let mobileNet = MobileNet()
            
            let prediction = try? mobileNet.prediction(image: pixelBuffer)
            
            let confidence = prediction?.classLabelProbs[prediction?.classLabel ?? ""] ?? 0
    
            let confidencePercentage = round(confidence * 10000)/100
            
            DispatchQueue.main.async {
                self?.classificationLabel.text = "Category: \(prediction?.classLabel ?? "nil")"
                self?.confidenceLabel.text = "Confidence: \(confidencePercentage)%"
            }
                        
        }
        
    }

}
