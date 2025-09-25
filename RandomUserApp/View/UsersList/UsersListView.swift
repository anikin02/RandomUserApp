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
            .foregroundStyle(.black)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(.white)
      } else {
        ScrollView {
          LazyVStack {
            ForEach(Array(viewModel.users.enumerated()), id: \.element) { index, user in
              UserRowView(user: user)
              
              if index != viewModel.users.count - 1 {
                Divider()
                  .background(Color.gray.opacity(0.5))
              }
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
}
