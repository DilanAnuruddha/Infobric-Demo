//
//  ViewController.swift
//  Infobric Demo
//
//  Created by Dilan Anuruddha on 2022-09-20.
//

import UIKit

class HomeViewController: UIViewController {
    var galleryViewModels = [GalleryViewModel]()
    let cellId = "cellId"
    
    let gallery: UICollectionView =  {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Gallery"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupView()
        fetchData()
    }
    
    //Setup UI
    func setupView(){
        view.addSubViews(gallery)
        
        NSLayoutConstraint.activate([
            gallery.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gallery.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gallery.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            gallery.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        gallery.register(GalleryCell.self, forCellWithReuseIdentifier: cellId)
        gallery.delegate = self
        gallery.dataSource = self
    }

}


// MARK: Delegates
extension HomeViewController : UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! GalleryCell
        cell.galleryViewModel = galleryViewModels[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIDevice.current.userInterfaceIdiom == .pad ? CGSize(width: 200, height: 200) : CGSize(width: 100, height: 100)
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.galleryViewModel = galleryViewModels[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == galleryViewModels.count - 1 {
            self.fetchData()
        }
    }
}

//MARK: Functions
extension HomeViewController {
    fileprivate func fetchData() {
        if CheckConnection.isConnected() {
            Service.shared.fetchImages { [weak self] (photos, err) in
                if let err = err {
                    print("Failed to fetch images:", err)
                    Alert.showDefaultAlert(on: self!, title: "ERROR", message: err.localizedDescription)
                    return
                }
                self?.galleryViewModels += photos?.map({return GalleryViewModel(photo: $0)}) ?? []
                self?.gallery.reloadData()
            }
            
        }else{
            Alert.showNoConnectionAlert(on: self)
        }
    }
}

