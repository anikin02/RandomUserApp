//
//  UsersListViewModel.swift
//  RandomUserApp
//
//  Created by Данил Аникин on 25/09/2025.
//

import Foundation

class UsersListViewModel: ObservableObject {
  
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
    DispatchQueue.main.async { [weak self] in
      if let encoded = try? JSONEncoder().encode(self?.users) {
        UserDefaults.standard.set(encoded, forKey: "savedUsers")
      }
    }
  }
  
  private func loadUsers() {
    DispatchQueue.main.async { [weak self] in
      if let data = UserDefaults.standard.data(forKey: "savedUsers"),
         let decoded = try? JSONDecoder().decode([User].self, from: data) {
        self?.users = decoded
      }
    }
  }
}
