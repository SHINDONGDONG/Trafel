//
//  OnboardingCollectionViewCell.swift
//  Trafel
//
//  Created by 申民鐡 on 2022/06/15.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properteis
    @IBOutlet weak var slideImageView: UIImageView!
    
    //MARK: - Configures
    func configure(image: UIImage) {
        slideImageView.image = image
    }
    
}
