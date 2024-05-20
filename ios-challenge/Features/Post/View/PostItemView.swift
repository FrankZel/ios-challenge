//
//  PostItemView.swift
//  ios-challenge
//
//  Created by Franco Zelener on 19/05/2024.
//

import SwiftUI

struct PostItemView: View {
    
    var post: Post
    var author: String
    
    var body: some View {
        HStack{
            VStack (alignment: .leading) {
                Text(post.title)
                    .font(.body)
                    .bold()
                Text("by \(author)")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                TagLabelView(color: .mint, text: post.category)
            }
            .padding()
            
            AsyncImage(
                url: URL(string: post.thumbnail),
                content: { image in
                    image.resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(maxWidth: 100, maxHeight: 100)
                         .cornerRadius(10)
                         
                }, placeholder: {
                    ProgressView()
                        .frame(maxWidth: 100, maxHeight: 100)
                })
            .padding(.leading)
            
        }
        .frame(height: 100)
    }
    
}


#Preview {
    PostItemView(post: Post(id: 1, slug: "a", url: "asd", title: "Hello everybody", content: "JAJAJAJAJJAJAJAJAJAJAJAJAJAJJAJAAJ", image: "nice", thumbnail: "https://dummyimage.com/200x200/08110f/condimentum..png&text=jsonplaceholder.org", status: "published", category: "published", publishedAt: "04/02/2023 13:25:21", updatedAt: "04/02/2023 13:25:21", userID: 1), author: "John doe")
}
