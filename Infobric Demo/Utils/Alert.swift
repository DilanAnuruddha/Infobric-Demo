//
//  Alert.swift
//  Infobric Demo
//
//  Created by Dilan Anuruddha on 2022-09-20.
//

import Foundation
import UIKit

class Alert {
    
    //Base Alert
    private static func showAlert(on vc : UIViewController , title : String , message : String ,actions:[UIAlertAction]){
            DispatchQueue.main.async {
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                for item in actions{
                    alert.addAction(item)
                }
                vc.present(alert , animated: true)
            }
        }
    
    //Default Alert
    public static func showDefaultAlert(on vc : UIViewController , title : String , message : String){
            let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
            showAlert(on: vc, title: title, message: message, actions: [action])
        }
    
    //500 Error
    public static func showSomethingWentWrongAlert(on vc :UIViewController){
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            showAlert(on: vc, title: "Something went wrong", message: "There was an issue of some sort.Please try again after few minutes.", actions: [action])
        }
    
    //No Connection
    public static func showNoConnectionAlert(on vc : UIViewController){
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        showAlert(on: vc, title: "No Internet Connection", message: "You require an internet connection WiFi or cellular network.", actions: [action])
    }
    
    public static func showSuccessMessage(on vc:UIViewController,message:String, handler: @escaping (UIAlertAction) -> Void) {
        let action = UIAlertAction(title: "Dismiss", style: .default, handler: handler)
        showAlert(on: vc, title: "Success", message: message, actions: [action])
    }
    
}

