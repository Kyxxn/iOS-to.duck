//
//  FetchUserDetailUseCase.swift
//  toduck
//
//  Created by 신효성 on 6/22/24.
//

import Foundation

public final class FetchUserDetailUseCase {
    private let repostiory: UserRepositoryProtocol

    public init(repostiory: UserRepositoryProtocol) {
        self.repostiory = repostiory
    }

    public func execute(user: User) async throws -> UserDetail {
        return try await repostiory.fetchUserDetail(userId: user.id)
    }
}