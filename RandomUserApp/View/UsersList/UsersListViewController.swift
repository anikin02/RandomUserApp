//
//  UsersListViewController.swift
//  RandomUserApp
//
//  Created by Данил Аникин on 24/09/2025.
//

import UIKit

class UsersListViewController: UIViewController {
  
  private lazy var addNewUserButton = {
    $0.setTitle("Add new user", for: .normal)
    $0.configuration = .filled()
    $0.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.configuration?.baseBackgroundColor = .appOrange
    return $0
  }(UIButton())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    view.addSubview(addNewUserButton)
    addNewUserButton.addTarget(self, action: #selector(addNewUser), for: .touchUpInside)
    setConstraints()
  }
  
  private func setConstraints(){
    NSLayoutConstraint.activate([
      addNewUserButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      addNewUserButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
    ])
    
  }
  
  @objc func addNewUser(){
    
  }
}

