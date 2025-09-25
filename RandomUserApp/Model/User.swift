//
//  User.swift
//  RandomUserApp
//
//  Created by Данил Аникин on 24/09/2025.
//

import Foundation

struct UserResponse: Codable {
  let results: [User]
}

struct User: Codable, Hashable, Equatable {
  let gender: String
  let name: Name
  let location: Location
  let dob: DOB
  let picture: Picture
  let nat: String
}

struct Name: Codable, Hashable, Equatable {
  let title: String
  let first: String
  let last: String
}

struct Location: Codable, Hashable, Equatable {
  let city: String
  let country: String
  let coordinates: Coordinates
}

struct Coordinates: Codable, Hashable, Equatable {
  let latitude: String
  let longitude: String
}

struct DOB: Codable, Hashable, Equatable {
  let age: Int
}

struct Picture: Codable, Hashable, Equatable {
  let large: String
}
