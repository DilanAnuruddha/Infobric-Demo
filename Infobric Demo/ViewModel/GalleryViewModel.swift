//
//  GalleryViewModel.swift
//  Infobric Demo
//
//  Created by Dilan Anuruddha on 2022-09-21.
//

import Foundation

struct GalleryViewModel {
    let urls: Urls
    let user:User

    init(photo: Photo) {
        self.urls = photo.urls
        self.user = photo.user
    }
}
