//
//  UsersListViewModel.swift
//  RandomUserApp
//
//  Created by Данил Аникин on 25/09/2025.
//

import Combine
import Foundation

class UsersListViewModel: ObservableObject {
  @Published var users: [User] = []
  
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
}
