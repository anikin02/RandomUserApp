//
//  APIManger.swift
//  RandomUserApp
//
//  Created by Данил Аникин on 24/09/2025.
//

import Foundation

class APIManger {
  static let shared = APIManger()
  private init() {}
  
  func getRandomUser(completion: @escaping (User) -> Void) {
      let urlString = "https://randomuser.me/api/"
      guard let url = URL(string: urlString) else { return }
      
      let session = URLSession(configuration: .default)
      let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
        if error != nil {
          print(error!.localizedDescription)
        } else if let data = data {
          do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(UserResponse.self, from: data)
            completion(response.results.first!)
          } catch {
            print(error.localizedDescription)
          }
        }
      })
      task.resume()
    }
}
