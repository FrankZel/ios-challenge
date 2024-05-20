//
//  ContentView.swift
//  ios-challenge
//
//  Created by Franco Zelener on 19/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PostListView()
                .tabItem {
                    Label("Posts", systemImage: "book.fill")
                }
            
            UserListView()
                .tabItem {
                    Label("Users", systemImage: "person.fill")
                }
        }
        
    }
}


#Preview {
    ContentView()
}
