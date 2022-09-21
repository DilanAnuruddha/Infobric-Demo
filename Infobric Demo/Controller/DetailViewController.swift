//
//  DetailViewController.swift
//  Infobric Demo
//
//  Created by Dilan Anuruddha on 2022-09-21.
//

import UIKit

class DetailViewController: UIViewController {

    var galleryViewModel:GalleryViewModel!
    
    //MARK: Components
    let imgMain:UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemBackground
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let imgAuthor:UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 25
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let lblAuthorName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return lbl
    }()
    
    let lblAuthorBio: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        lbl.textColor = .darkGray
        lbl.numberOfLines = 0
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Details"
        navigationItem.largeTitleDisplayMode = .never
        setupView()
        loadData()
    }
    
    func setupView(){
        view.addSubViews(imgMain,imgAuthor,lblAuthorName,lblAuthorBio)
        
        NSLayoutConstraint.activate([
            imgMain.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imgMain.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imgMain.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imgMain.heightAnchor.constraint(equalToConstant: view.bounds.width - 100 > view.bounds.height ? 200 : view.bounds.width),
            
            imgAuthor.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imgAuthor.topAnchor.constraint(equalTo: imgMain.bottomAnchor, constant: 32),
            imgAuthor.widthAnchor.constraint(equalToConstant: 50),
            imgAuthor.heightAnchor.constraint(equalToConstant: 50),
            
            lblAuthorName.leadingAnchor.constraint(equalTo: imgAuthor.trailingAnchor , constant: 16),
            lblAuthorName.topAnchor.constraint(equalTo: imgAuthor.topAnchor),
            lblAuthorName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            lblAuthorBio.leadingAnchor.constraint(equalTo: imgAuthor.trailingAnchor , constant: 16),
            lblAuthorBio.topAnchor.constraint(equalTo: lblAuthorName.bottomAnchor, constant: 2),
            lblAuthorBio.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        imgMain.contentMode = view.bounds.width - 100 > view.bounds.height ? .scaleAspectFit : .scaleToFill
    }
    
    //load data to the relavant fields
    func loadData(){
        imgMain.loadImageUsingCache(galleryViewModel?.urls.full ?? "")
        imgAuthor.loadImageUsingCache(galleryViewModel?.user.profileImage.small ?? "")
        lblAuthorName.text = "\(galleryViewModel?.user.firstName ?? "") \(galleryViewModel?.user.lastName ?? "")"
        lblAuthorBio.text = galleryViewModel?.user.bio ?? "N/A"
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        imgMain.contentMode = view.bounds.width - 100 > view.bounds.height ? .scaleAspectFit : .scaleToFill
        view.layoutSubviews()
    }
}
