//
//  CardCollectionViewCell.swift
//  AppStudyEnglish_MVC
//
//  Created by sss on 07.01.2023.
//

import UIKit

final class CardCollectionViewCell: UICollectionViewCell {
    
    //MARK: Properties
    
    var imageView: UIImageView!
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Methods
    
    private func createImageView() {
        
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.frame = contentView.bounds
        contentView.addSubview(imageView)
        
    }
}
