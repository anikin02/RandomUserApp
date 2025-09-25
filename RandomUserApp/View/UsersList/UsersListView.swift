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
        List {
          ForEach(Array(viewModel.users.enumerated()), id: \.element) { index, user in
            VStack {
              UserRowView(user: user)
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                  Button(role: .destructive) {
                    withAnimation {
                      viewModel.deleteUser(at: index)
                    }
                  } label: {
                    Label("Delete", systemImage: "trash")
                  }
                }
              if index != viewModel.users.count - 1 {
                Divider()
              }
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.white)
          }
        }
        .scrollContentBackground(.hidden)
        .animation(.default, value: viewModel.users)
        .listStyle(PlainListStyle())
        .background(.white)
      }
    }
  }
}
