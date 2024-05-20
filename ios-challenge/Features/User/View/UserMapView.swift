//
//  UserMapView.swift
//  ios-challenge
//
//  Created by Franco Zelener on 19/05/2024.
//

import SwiftUI
import MapKit

struct UserMapView: View {
    var user: User
    
    private var avatarId = Int.random(in: 1...6)
    
    @State private var userPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 41.81060082824547, longitude: -88.3911426869676),
            span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        )
    )
    
    @State private var showDrawer = true
    
    init(user: User) {
        self.user = user
        self.userPosition = getPosition()
    }
    
    var body: some View {
        ZStack{
            Map(position: $userPosition) {
                Annotation("", coordinate: CLLocationCoordinate2D(latitude: Double(user.address.geo.lat) ?? 0, longitude: Double(user.address.geo.lng) ?? 0)) {
                    Image( "avatar-\(avatarId)")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.black, lineWidth: 3))
                }
            }
            .onAppear{
                userPosition = getPosition()
            }
            .sheet(isPresented: $showDrawer) {
                UserDetailView(user: user, avatarId: avatarId)
                    .interactiveDismissDisabled()
                    .presentationDetents([.height(150), .medium, .large])
                    .presentationBackgroundInteraction(
                        .enabled(upThrough: .large)
                    )
            }
            .safeAreaInset(edge: .top, alignment: .trailing, content: {
              RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .frame(width: 40, height: 40)
                .overlay {
                  Image(systemName: "paperplane.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundStyle(Color.accentColor)
                }
                .onTapGesture {
                  withAnimation {
                      userPosition = getPosition()
                  }
                }
                .padding(.trailing, 10)
              })
            }
        .toolbarBackground(.hidden, for: .navigationBar)
        }
    }
    


#Preview {
    UserMapView(user: User(id: 1, firstname: "John", lastname: "Doe", email: "johndoe@example.com", birthDate: "1973-01-22", login: Login(uuid: "1a0eed01-9430-4d68-901f-c0d4c1c3bf22", username: "johndoe", password: "jsonplaceholder.org", md5: "c1328472c5794a25723600f71c1b4586", sha1: "35544a31cc19bd6520af116554873167117f4d94", registered: "2023-01-10T10:03:20.022Z"), address: Address(street: "123 Main Street", suite: "Apt. 4", city: "Anytown", zipcode: "12345-6789", geo: Geo(lat: "42.1234", lng: "-71.2345")), phone: "(555) 555-1234", website: "www.johndoe.com", company: Company(name: "ABC Company", catchPhrase:  "Innovative solutions for all your needs", bs: "Marketing")))
}

extension UserMapView {
    
    
    func getPosition() -> MapCameraPosition {
        
        let lat = Double(user.address.geo.lat)
        let long = Double(user.address.geo.lng)
        
        return MapCameraPosition.region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude:lat ?? 0, longitude:long ?? 0 ),
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            )
        )
    }
}
