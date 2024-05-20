//
//  UserViewModel.swift
//  ios-challenge
//
//  Created by Franco Zelener on 19/05/2024.
//

import Foundation



@Observable
class UsersViewModel {
    
    var users: [User] = []
    
    
    func fetchUsers() async throws {
        let url = "https://jsonplaceholder.org/users"
        
        guard let downloadedUsers: [User] = await APIservice().downloadData(fromURL: url) else {return}
        self.users = downloadedUsers
    }
}
