//
//  PostListView.swift
//  ios-challenge
//
//  Created by Franco Zelener on 19/05/2024.
//

import SwiftUI

struct PostListView: View {
    
    @State private var model = PostsViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack{
            List(searchResults) { post in
                NavigationLink(value: post){
                    PostItemView(post: post, author: model.getAuthor(id: post.id))
                }
            }.task {
                await model.fetch()
            }
            .navigationTitle("Posts")
            .navigationDestination(for: Post.self) { post in
                PostDetailView(post: post)
            }
        }
        .searchable(text: $searchText)
    }
    
    var searchResults: [Post] {
        if searchText.isEmpty {
            return model.posts
        } else {
            return model.posts.filter { $0.title.contains(searchText) || $0.content.contains(searchText) }
        }
    }
}

#Preview {
    PostListView()
}

