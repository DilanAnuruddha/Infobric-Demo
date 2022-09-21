//
//  GalleryCell.swift
//  Infobric Demo
//
//  Created by Dilan Anuruddha on 2022-09-20.
//

import UIKit

class GalleryCell: UICollectionViewCell {
    
    var galleryViewModel: GalleryViewModel! {
        didSet {
            imgThumb.loadImageUsingCache(galleryViewModel.urls.thumb)
        }
    }
    
    let imgThumb:UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        return iv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        addSubViews(imgThumb)
        
        NSLayoutConstraint.activate([
            imgThumb.centerYAnchor.constraint(equalTo: centerYAnchor),
            imgThumb.centerXAnchor.constraint(equalTo: centerXAnchor),
            imgThumb.widthAnchor.constraint(equalTo: widthAnchor),
            imgThumb.heightAnchor.constraint(equalTo: heightAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
