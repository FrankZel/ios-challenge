//
//  UserItemView.swift
//  ios-challenge
//
//  Created by Franco Zelener on 19/05/2024.
//

import SwiftUI

struct UserItemView: View {
    var user: User
    
    var body: some View {
        HStack{
            VStack (alignment: .leading) {
                Text("\(user.firstname) \(user.lastname) ")
                    .font(.body)
                    .bold()
                Text("\(user.email)")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                Text("\(user.address.street), \(user.address.city)")
                    .font(.caption)
                    .foregroundColor(Color(.secondaryLabel))
                Text("\(user.phone)")
                    .font(.caption)
                    .bold()
                    .foregroundColor(Color(.secondaryLabel))
            }
            .padding()
        }
        .frame(height: 100)
    }
}

#Preview {
    UserItemView(user: User(id: 1, firstname: "John", lastname: "Doe", email: "johndoe@example.com", birthDate: "1973-01-22", login: Login(uuid: "1a0eed01-9430-4d68-901f-c0d4c1c3bf22", username: "johndoe", password: "jsonplaceholder.org", md5: "c1328472c5794a25723600f71c1b4586", sha1: "35544a31cc19bd6520af116554873167117f4d94", registered: "2023-01-10T10:03:20.022Z"), address: Address(street: "123 Main Street", suite: "Apt. 4", city: "Anytown", zipcode: "12345-6789", geo: Geo(lat: "42.1234", lng: "-71.2345")), phone: "(555) 555-1234", website: "www.johndoe.com", company: Company(name: "ABC Company", catchPhrase:  "Innovative solutions for all your needs", bs: "Marketing")))
}
