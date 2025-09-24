//
//  SceneDelegate.swift
//  RandomUserApp
//
//  Created by Данил Аникин on 24/09/2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    window = UIWindow(windowScene: windowScene)
    window?.windowScene = windowScene
    window?.makeKeyAndVisible()
    window?.rootViewController = UsersListViewController()
  }
  
}

