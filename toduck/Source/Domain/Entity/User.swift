//
//  User.swift
//  toduck
//
//  Created by 신효성 on 6/13/24.
//

import Foundation

public struct User {
    let id: Int
    var name: String
    var icon: String?
    var title: String
    var isblock: Bool
    
    init(
        id: Int,
        name: String,
        icon: String?,
        title: String,
        isblock: Bool
    ) {
        self.id = id
        self.name = name
        self.icon = icon
        self.title = title
        self.isblock = isblock
    }
}

public struct UserDetail {
    


    var isFollowing: Bool
    var follwingCount: Int
    var followerCount: Int
    
    var totalPostNReply: Int
    var profileURL: String

    var whofollow: [String]?
    var routines: [Routine]?
    var routineShareCount: Int
    var posts: [Post]?
}

