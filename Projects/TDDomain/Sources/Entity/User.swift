//
//  User.swift
//  toduck
//
//  Created by 신효성 on 6/13/24.
//

import Foundation

public struct User {
    public let id: Int
    public let name: String
    public let icon: String?
    public let title: String
    public let isblock: Bool
    
    public init(
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
    public let isFollowing: Bool
    public let follwingCount: Int
    public let followerCount: Int
    
    public let totalPostNReply: Int
    public let profileURL: String

    public let whofollow: [String]?
    public let routines: [Routine]?
    public let routineShareCount: Int
    public let posts: [Post]?
    
    public init(
        isFollowing: Bool,
        follwingCount: Int,
        followerCount: Int,
        totalPostNReply: Int,
        profileURL: String,
        whofollow: [String]? = nil,
        routines: [Routine]? = nil,
        routineShareCount: Int,
        posts: [Post]? = nil
    ) {
        self.isFollowing = isFollowing
        self.follwingCount = follwingCount
        self.followerCount = followerCount
        self.totalPostNReply = totalPostNReply
        self.profileURL = profileURL
        self.whofollow = whofollow
        self.routines = routines
        self.routineShareCount = routineShareCount
        self.posts = posts
    }
}
