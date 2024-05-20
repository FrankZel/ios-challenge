//
//  UserListView.swift
//  ios-challenge
//
//  Created by Franco Zelener on 19/05/2024.
//

import SwiftUI

struct UserListView: View {
    @State private var model = UsersViewModel()
    
    var body: some View {
        NavigationStack{
            List(model.users) { user in
                NavigationLink(value: user){
                    UserItemView(user: user)}
            }.task {
                try? await model.fetchUsers()
            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                UserMapView(user: user)
            }
        }
        
    }
}

#Preview {
    UserListView()
}
