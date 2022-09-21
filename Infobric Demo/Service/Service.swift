//
//  Service.swift
//  Infobric Demo
//
//  Created by Dilan Anuruddha on 2022-09-20.
//

import Foundation

class Service {
    static let shared = Service()
    static var page:Int = 1
    
    //MARK: Fetch Images
    func fetchImages(completion: @escaping ([Photo]?, Error?) -> ()) {
        var components = URLComponents(string: URLS.PhotoList.rawValue)!
        components.queryItems = [
            URLQueryItem(name: "client_id", value: Token.Access),
            URLQueryItem(name: "per_page", value: "20"),
            URLQueryItem(name: "page", value: "\(Service.page)")
        ]
        let request = URLRequest(url: components.url!)
        
        URLSession.shared.dataTask(with: request) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Failed to fetch photos:", err)
                return
            }
            
            
            guard let data = data else { return }
            do {
                let photos = try JSONDecoder().decode([Photo].self, from: data)
                DispatchQueue.main.async {
                    Service.page += 1
                    completion(photos, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
            }.resume()
    }
}
