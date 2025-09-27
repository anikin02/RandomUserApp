//
//  UserDetailsView.swift
//  RandomUserApp
//
//  Created by Данил Аникин on 26/09/2025.
//

import SwiftUI
import MapKit

struct UserDetailsView: View {
  @State private var mapPosition: MapCameraPosition = .automatic
  let user: User
  
  var body: some View {
    VStack {
      HStack {
        AsyncImage(url: URL(string: user.picture.large)) { phase in
          switch phase {
          case .empty:
            ProgressView()
              .progressViewStyle(CircularProgressViewStyle(tint: .appOrange))
              .frame(width: 125, height: 125)
            
          case .success(let image):
            image
              .resizable()
              .scaledToFit()
              .frame(width: 125, height: 125)
            
          case .failure:
            ProgressView()
              .frame(width: 125, height: 125)
          @unknown default:
            EmptyView()
          }
        }
        VStack(alignment: .leading) {
          Text(user.name.title)
            .font(.system(size: 19, weight: .black))
            .foregroundStyle(user.gender == "male" ? .appColorMale : .appColorFemale)
          Text(user.name.first)
            .font(.system(size: 19, weight: .black))
            .foregroundStyle(user.gender == "male" ? .appColorMale : .appColorFemale)
          Text(user.name.last)
            .font(.system(size: 19, weight: .black))
            .foregroundStyle(user.gender == "male" ? .appColorMale : .appColorFemale)
          Text("Sex: \(user.gender) \(user.gender == "male" ? "♂️" : "♀️")")
            .font(.system(size: 17, weight: .medium))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
      }
      VStack(alignment: .leading) {
        Text("Age: \(user.dob.age)")
        Text("Coutnry: \(user.location.country)")
        Text("City: \(user.location.city)")
        Text("Nationality: \(user.nat)")
        Spacer()
        Map(position: $mapPosition)
          .frame(height: 300)
          .onAppear() {
            DispatchQueue.main.async {
              let coordinate = CLLocationCoordinate2D(latitude: Double(user.location.coordinates.latitude) ?? 0,
                                                      longitude: Double(user.location.coordinates.longitude) ?? 0)
              let coordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1,
                                                    longitudeDelta: 0.1)
              let coordinateRegion = MKCoordinateRegion(center: coordinate,
                                                        span: coordinateSpan)
              mapPosition = .region(coordinateRegion)
            }
          }
        Spacer()
      }
      .frame(maxWidth: .infinity, alignment: .leading)
    }
    .onAppear {
      NotificationCenter.default.post(name: .hideAddUserButton, object: nil)
    }
    .onDisappear {
      NotificationCenter.default.post(name: .showAddUserButton, object: nil)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(.white)
  }
}
