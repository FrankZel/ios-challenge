//
//  PostsViewModel.swift
//  ios-challenge
//
//  Created by Franco Zelener on 19/05/2024.
//

import Foundation

@Observable
class PostsViewModel {
    
    var posts: [Post] = []
    var users: [User] = []
    
    
    func fetch() async {
        try? await fetchPosts()
        try? await fetchUsers()
    }
    
    func fetchPosts() async throws {
        let url = "https://jsonplaceholder.org/posts"
        
        guard let downloadedPosts: [Post] = await APIservice().downloadData(fromURL: url) else {return}
        self.posts = downloadedPosts
    }
    
    func fetchUsers() async throws {
        let url = "https://jsonplaceholder.org/users"
        
        guard let downloadedUsers: [User] = await APIservice().downloadData(fromURL: url) else {return}
        self.users = downloadedUsers
    }
    
    func getAuthor(id: Int) -> String {
        guard let user =  users.first(where: {$0.id == id}) else {return ""}
        
        return "\(user.firstname) \(user.lastname)"
    }
    
}
