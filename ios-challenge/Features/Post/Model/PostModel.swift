//
//  PostModel.swift
//  ios-challenge
//
//  Created by Franco Zelener on 19/05/2024.
//

import Foundation

struct Post: Codable, Identifiable, Hashable {
    let id: Int
    let slug: String
    let url: String
    let title, content: String
    let image, thumbnail: String
    let status, category, publishedAt, updatedAt: String
    let userID: Int

    enum CodingKeys: String, CodingKey {
        case id, slug, url, title, content, image, thumbnail, status, category, publishedAt, updatedAt
        case userID = "userId"
    }
}
