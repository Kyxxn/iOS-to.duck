//
//  FetchUserShareUrlUseCase.swift
//  toduck
//
//  Created by 신효성 on 6/22/24.
//

import Foundation

public final class FetchUserShareUrlUseCase {
    private let repostiory: UserRepositoryProtocol

    public init(repostiory: UserRepositoryProtocol) {
        self.repostiory = repostiory
    }

    public func execute(user: User) async throws -> String {
        return try await repostiory.fetchUserShareUrl(userId: user.id)
    }
}