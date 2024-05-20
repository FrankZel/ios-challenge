//
//  TagLabelView.swift
//  ios-challenge
//
//  Created by Franco Zelener on 19/05/2024.
//

import SwiftUI

struct TagLabelView: View {
    
    var color: Color
    var text: String
    
    var body: some View {
        ZStack{
            Text(text)
                .font(/*@START_MENU_TOKEN@*/.caption2/*@END_MENU_TOKEN@*/)
                .foregroundColor(color)
                .padding(5)
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(color, lineWidth: 2))
        }
    }
}

#Preview {
    TagLabelView(color: .blue, text: "Interesting")
}
