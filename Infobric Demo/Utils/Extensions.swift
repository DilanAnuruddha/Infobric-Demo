//
//  Extensions.swift
//  Infobric Demo
//
//  Created by Dilan Anuruddha on 2022-09-20.
//

import Foundation
import UIKit

//MARK: UIView
extension UIView {
    //Add multiple subviews and remove default constraint binding
    func addSubViews(_ views:UIView...){
        views.forEach({
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        })
    }
}

//MARK: UIImageView
let imageCache = NSCache<NSString, AnyObject>()

extension UIImageView {
    func loadImageUsingCache(_ urlString: String) {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .large
        
        self.image = nil
        
        if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = cachedImage
            return
        }
        
        self.addSubViews(activityIndicator)
        activityIndicator.center = self.center
        activityIndicator.startAnimating()
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            if let error = error {
                print(error)
                activityIndicator.stopAnimating()
                return
            }
            
            DispatchQueue.main.async(execute: {
                if let downloadedImage = UIImage(data: data!) {
                    imageCache.setObject(downloadedImage, forKey: urlString as NSString)
                    self.image = downloadedImage
                    activityIndicator.stopAnimating()
                }
            })
            
        }).resume()
    }
    
}
