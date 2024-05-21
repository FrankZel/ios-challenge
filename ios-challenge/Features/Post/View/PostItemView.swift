//
//  PostItemView.swift
//  ios-challenge
//
//  Created by Franco Zelener on 19/05/2024.
//

import SwiftUI

struct PostItemView: View {
    
    var post: Post
    
    @State private var model = PostsViewModel()
    
    var body: some View {
        HStack{
            VStack (alignment: .leading) {
                Text(post.title)
                    .font(.body)
                    .bold()
                Text("by \(model.getAuthor(id: post.userID))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                TagLabelView(color: Color.random(), text: post.category)
            }
            .padding()
            
            Spacer()
            
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
        .task {
            await model.fetch()
        }
        .frame(height: 150)
    }
    
}


#Preview {
    PostItemView(post: Post(id: 1, slug: "lorem-ipsum", url: "asd", title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", content: "Ante taciti nulla sit libero orci sed nam. Sagittis suspendisse gravida ornare iaculis cras nullam varius ac ullamcorper. Nunc euismod hendrerit netus ligula aptent potenti. Aliquam volutpat nibh scelerisque at. Ipsum molestie phasellus euismod sagittis mauris, erat ut. Gravida morbi, sagittis blandit quis ipsum mi mus semper dictum amet himenaeos. Accumsan non congue praesent interdum habitasse turpis orci. Ante curabitur porttitor ullamcorper sagittis sem donec, inceptos cubilia venenatis ac. Augue fringilla sodales in ullamcorper enim curae; rutrum hac in sociis! Scelerisque integer varius et euismod aenean nulla. Quam habitasse risus nullam enim. Ultrices etiam viverra mattis aliquam? Consectetur velit vel volutpat eget curae;. Volutpat class mus elementum pulvinar! Nisi tincidunt volutpat consectetur. Primis morbi pulvinar est montes diam himenaeos duis elit est orci. Taciti sociis aptent venenatis dui malesuada dui justo faucibus primis consequat volutpat. Rhoncus ante purus eros nibh, id et hendrerit pellentesque scelerisque vehicula sollicitudin quam. Hac class vitae natoque tortor dolor dui praesent suspendisse. Vehicula euismod tincidunt odio platea aenean habitasse neque ad proin. Bibendum phasellus enim fames risus eget felis et sem fringilla etiam. Integer", image: "https://dummyimage.com/200x200/08110f/condimentum..png&text=jsonplaceholder.org", thumbnail: "https://dummyimage.com/200x200/08110f/condimentum..png&text=jsonplaceholder.org", status: "published", category: "published", publishedAt: "04/02/2023 13:25:21", updatedAt: "04/02/2023 13:25:21", userID: 1))
}
