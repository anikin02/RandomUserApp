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

struct User: Codable {
  let gender: String
  let name: Name
  let location: Location
  let dob: DOB
  let picture: Picture
  let nat: String
}

struct Name: Codable {
  let title: String
  let first: String
  let last: String
}

struct Location: Codable {
  let city: String
  let country: String
  let coordinates: Coordinates
}

struct Coordinates: Codable {
  let latitude: String
  let longitude: String
}

struct DOB: Codable {
  let age: Int
}

struct Picture: Codable {
  let large: String
}
