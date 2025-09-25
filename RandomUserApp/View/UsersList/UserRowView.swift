//
//  UserRowView.swift
//  RandomUserApp
//
//  Created by Данил Аникин on 25/09/2025.
//

import SwiftUI

struct UserRowView: View {
  var user: User
  
  var body: some View {
    HStack(alignment: .center) {
      AsyncImage(url: URL(string: user.picture.large)) { phase in
        switch phase {
        case .empty:
          ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .appOrange))
            .frame(width: 100, height: 100)
          
        case .success(let image):
          image
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
          
        case .failure:
          ProgressView()
            .frame(width: 100, height: 100)
            .cornerRadius(10)
        @unknown default:
          EmptyView()
        }
        
      }
      .clipShape(.circle)
      
      VStack(alignment: .leading) {
        Text("\(user.name.title). \(user.name.first) \(user.name.last)")
          .font(.system(size: 17, weight: .medium))
          .foregroundStyle(.black)
        Text("Age: \(user.dob.age)")
          .foregroundStyle(.black)
          .font(.system(size: 15, weight: .regular))
        Text("Country: \(user.location.country)")
          .foregroundStyle(.black)
          .font(.system(size: 15, weight: .regular))
      }
      .frame(maxWidth: .infinity, alignment: .leading)
    }
    .frame(alignment: .leading)
  }
}
