//
//  User.swift
//  GHFollowers
//
//  Created by apple on 19/03/25.
//

import Foundation

struct User: Decodable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var followers: Int
    var createdAt: String
}
