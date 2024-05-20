//
//  UserModel.swift
//  ios-challenge
//
//  Created by Franco Zelener on 19/05/2024.
//

import Foundation

import Foundation

// MARK: - Post
struct User: Codable, Identifiable, Hashable {
    let id: Int
    let firstname, lastname, email, birthDate: String
    let login: Login
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address: Codable, Hashable{
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable, Hashable{
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable, Hashable {
    let name, catchPhrase, bs: String
}

// MARK: - Login
struct Login: Codable, Hashable{
    let uuid, username, password, md5: String
    let sha1, registered: String
}
