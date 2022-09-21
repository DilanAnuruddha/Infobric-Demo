//
//  Photo.swift
//  Infobric Demo
//
//  Created by Dilan Anuruddha on 2022-09-21.
//

import Foundation

// MARK: - Photo
struct Photo: Codable {
    let id: String
    let width, height: Int
    let urls: Urls
    let user: User
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String
    let thumb, smallS3: String

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}

// MARK: - User
struct User: Codable {
    let id, username, name, firstName: String
    let lastName: String?
    let bio: String?
    let profileImage: ProfileImage

    enum CodingKeys: String, CodingKey {
        case id, username, name,bio
        case firstName = "first_name"
        case lastName = "last_name"
        case profileImage = "profile_image"
    }
}

// MARK: - ProfileImage
struct ProfileImage: Codable {
    let small, medium, large: String
}
