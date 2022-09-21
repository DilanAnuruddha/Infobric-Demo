//
//  EmptyBackgroundView.swift
//  Infobric Demo
//
//  Created by Dilan Anuruddha on 2022-09-21.
//

import Foundation
import UIKit

class EmptyBackgroundView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let imgView :UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.backgroundColor = .clear
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    let lblHeader:UILabel = {
        let lbl = UILabel()
        lbl.text = "--"
        lbl.textColor = .darkGray
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        lbl.textAlignment = .center
        return lbl
    }()

    let lblDescription : UILabel = {
        let lbl = UILabel()
        lbl.text = "--"
        lbl.textColor = .darkGray
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .light)
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        return lbl
    }()


    func setupView()  {
        addSubViews(imgView,lblHeader,lblDescription)

        NSLayoutConstraint.activate([
            imgView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imgView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2),
            imgView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2),
            imgView.bottomAnchor.constraint(equalTo: lblHeader.topAnchor, constant: -8),

            lblHeader.centerXAnchor.constraint(equalTo: centerXAnchor),
            lblHeader.centerYAnchor.constraint(equalTo:centerYAnchor),
            lblHeader.leadingAnchor.constraint(equalTo: leadingAnchor,constant:  16),
            lblHeader.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            lblDescription.centerXAnchor.constraint(equalTo: centerXAnchor ),
            lblDescription.topAnchor.constraint(equalTo: lblHeader.bottomAnchor , constant:  16),
            lblDescription.leadingAnchor.constraint(equalTo: leadingAnchor,constant:  16),
            lblDescription.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -16),
        ])


    }
}

