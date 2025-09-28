//
//  UsersListViewModel.swift
//  RandomUserApp
//
//  Created by Данил Аникин on 25/09/2025.
//

import Foundation

class UsersListViewModel: ObservableObject {
  private let usersKey = "savedUsers"
  
  @Published var users: [User] = [] {
    didSet {
      saveUsers()
    }
  }
  
  init() {
    loadUsers()
  }
  
  func deleteUser(at index: Int) {
    users.remove(at: index)
  }
  
  func addNewUser() {
    APIManger.shared.getRandomUser { user in
      DispatchQueue.main.async { [weak self] in
        self?.users.append(user)
      }
    }
  }
  
  private func saveUsers() {
    if let encoded = try? JSONEncoder().encode(users) {
      UserDefaults.standard.set(encoded, forKey: usersKey)
    }
  }
  
  private func loadUsers() {
    if let data = UserDefaults.standard.data(forKey: usersKey),
       let decoded = try? JSONDecoder().decode([User].self, from: data) {
      users = decoded
    }
  }
}
