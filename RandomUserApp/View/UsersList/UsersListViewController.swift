//
//  UsersListViewController.swift
//  RandomUserApp
//
//  Created by Данил Аникин on 24/09/2025.
//

import UIKit
import SwiftUI

class UsersListViewController: UIViewController {
  // MARK: - Properties
  private var hostingController: UIHostingController<UsersListView>!
  
  private var viewModel = UsersListViewModel()
  
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
    
    setupHostingController()
    setupAddNewUserButton()
    setupConstraints()
  }
  
  // MARK: - Setup
  private func setupAddNewUserButton() {
    addNewUserButton.addTarget(self, action: #selector(addNewUser), for: .touchUpInside)
    view.addSubview(addNewUserButton)
  }
  
  private func setupHostingController() {
    let usersListView = UsersListView(viewModel: viewModel)
    hostingController = UIHostingController(rootView: usersListView)
    
    addChild(hostingController)
    view.addSubview(hostingController.view)
    hostingController.didMove(toParent: self)
    hostingController.view.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private func setupConstraints(){
    NSLayoutConstraint.activate([
      addNewUserButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      addNewUserButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
      
      hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
      hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
  
  // MARK: - Actions
  @objc func addNewUser(){
    withAnimation {
      viewModel.addNewUser()
    }
  }
}

