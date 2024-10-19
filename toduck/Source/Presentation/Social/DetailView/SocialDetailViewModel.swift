import Foundation

public final class SocialDetailViewModel: BaseViewModel {
    
    private var fetchPostUsecase: FetchPostUseCase
    private var likePostUseCase: TogglePostLikeUseCase
    private var createCommentUseCase: CreateCommentUseCase
    private var reportPostUseCase: ReportPostUseCase
    
    init(fetchPostUsecase: FetchPostUseCase,
                likePostUseCase: TogglePostLikeUseCase,
                createCommentUseCase: CreateCommentUseCase,
                reportPostUseCase: ReportPostUseCase,
                at postID: Int) {
        self.fetchPostUsecase = fetchPostUsecase
        self.likePostUseCase = likePostUseCase
        self.createCommentUseCase = createCommentUseCase
        self.reportPostUseCase = reportPostUseCase
    }
    
    func action(_ action: Action) {
        switch action {
        case .fetchPost:
            break
        case .likePost:
            break
        case .createComment:
            break
        case .shareRoutine:
            break
        case .reportPost:
            break
        case .blockPost:
            break
        case .blockCommet:
            break
        }
    }
}

extension SocialDetailViewModel {
    enum Action {
        case fetchPost
        case likePost
        case createComment
        case shareRoutine
        case reportPost
        case blockPost
        case blockCommet
    }
}

/*
 얘기 해보고싶었 던 것 : 아키텍처 너무 과한가 ? OverEngineering 이라고 생각하시나요 ?
 
Combine , Coordinator, MVVM, Clean Architecture , Moya, Tuist
 
 Tuist 흠 . . ? ?
 
 pbx 파일 XCode 16 해결해줌 pbx 넣어도돼 pbx파일안에
 
 Tuist
 
 
 
 
Kingfisher << 캐싱하는 부분 좀 고민해볼필요가있다.
 
 네트워크 통신할떄 고민해봐야할점
 
 
 1. 이미지 가져오는거 ? 서버에서 크기 잘라서 주는게 좋은듯 (디바이스 마다 이미지 크기 잘라서주는)
 
 
 
 

 */
