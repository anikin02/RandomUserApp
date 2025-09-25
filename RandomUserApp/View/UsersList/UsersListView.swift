//
//  UsersListView.swift
//  RandomUserApp
//
//  Created by Данил Аникин on 25/09/2025.
//

import SwiftUI

struct UsersListView: View {
  @ObservedObject var viewModel: UsersListViewModel
  
  var body: some View {
    
    NavigationStack {
      if viewModel.users.isEmpty {
        VStack {
          Text("There are no users yet")
            .font(.system(size: 23, weight: .black))
            .foregroundColor(.black)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(.white)
      } else {
        ScrollView {
          LazyVStack {
            ForEach(viewModel.users, id: \.self) { user in
              UserRowView(user: user)
            }
          }
          .padding(.bottom, 100)
          .padding()
        }
        .background(.white)
      }
    }
    .navigationTitle("Random Users")
  }
  
  struct UserRowView: View {
    var user: User
    
    var body: some View {
      
      VStack {
        
      }
      
      HStack {
        Text(user.name.first)
          .font(.title)
          .foregroundColor(.primary)
        Spacer()
        Text(user.name.last)
      }
      .background(.appOrange)
    }
  }
}
