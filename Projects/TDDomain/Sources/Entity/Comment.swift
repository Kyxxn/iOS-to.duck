//
//  Comment.swift
//  toduck
//
//  Created by 신효성 on 6/22/24.
//

import Foundation

public struct Comment {
    public let id: Int
    public let user: User
    public let content: String
    public let timestamp: Date
    public let isLike: Bool
    public let like: Int?
    
    public init(
        id: Int,
        user: User,
        content: String,
        timestamp: Date,
        isLike: Bool,
        like: Int?
    ) {
        self.id = id
        self.user = user
        self.content = content
        self.timestamp = timestamp
        self.isLike = isLike
        self.like = like
    }
}
