//
//  DomainAssembly.swift
//  TDDomain
//
//  Created by 박효준 on 10/21/24.
//

import Swinject

public struct DomainAssembly: Assembly {
    public init() { }
    
    public func assemble(container: Container) {
        container.register(FetchPostUseCase.self) { resolver in
            let repository = resolver.resolve(PostRepository.self)!
            return FetchPostUseCaseImpl(repository: repository)
        }
        
        container.register(TogglePostLikeUseCase.self) { resolver in
            let repository = resolver.resolve(PostRepository.self)!
            return TogglePostLikeUseCaseImpl(repository: repository)
        }
        
        container.register(CreateCommentUseCase.self) { resolver in
            let repository = resolver.resolve(CommentRepository.self)!
            return CreateCommentUseCaseImpl(repository: repository)
        }
        
        container.register(ReportPostUseCase.self) { resolver in
            let repository = resolver.resolve(PostRepository.self)!
            return ReportPostUseCaseImpl(repository: repository)
        }
        
    }
}
