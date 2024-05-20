//
//  UserDetailView.swift
//  ios-challenge
//
//  Created by Franco Zelener on 19/05/2024.
//

import SwiftUI
import MapKit

struct UserDetailView: View {
    var user: User
    var avatarId: Int
    
    var body: some View {
        
        List{
            Image("avatar-\(avatarId)")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(Circle().stroke(.black, lineWidth: 3))
                .shadow(radius: 10)
            Section("Info"){
                Text("\(user.firstname) \(user.lastname) ")
                Text(user.birthDate)
            }
            Section("Contact"){
                Text(user.email)
                Text(user.phone)
                Text(user.website)
            }
            Section("Address"){
                Text("\(user.address.suite) - \(user.address.street), \(user.address.zipcode), \(user.address.city) ")
            }
            Section("Company") {
                Text("\(user.company.name) - \(user.company.bs)")
            }
        }
    }
}

#Preview {
    UserDetailView(user: User(id: 1, firstname: "John", lastname: "Doe", email: "johndoe@example.com", birthDate: "1973-01-22", login: Login(uuid: "1a0eed01-9430-4d68-901f-c0d4c1c3bf22", username: "johndoe", password: "jsonplaceholder.org", md5: "c1328472c5794a25723600f71c1b4586", sha1: "35544a31cc19bd6520af116554873167117f4d94", registered: "2023-01-10T10:03:20.022Z"), address: Address(street: "123 Main Street", suite: "Apt. 4", city: "Anytown", zipcode: "12345-6789", geo: Geo(lat: "42.1234", lng: "-71.2345")), phone: "(555) 555-1234", website: "www.johndoe.com", company: Company(name: "ABC Company", catchPhrase:  "Innovative solutions for all your needs", bs: "Marketing")), avatarId: 2)
}
