//
//  UserModel.swift
//  NetworkInterchangeble
//
//  Created by hasan bilgin on 14.11.2023.
//

import Foundation

// MARK: - UserModel
struct UserModel: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}




//https://jsonplaceholder.typicode.com/users
//https://app.quicktype.io modelini oluşturduk


