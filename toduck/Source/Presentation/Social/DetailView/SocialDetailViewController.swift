import UIKit

final class SocialDetailViewController: BaseViewController<SocialDetailView> {
    weak var coordinator: SocialDetailCoordinator?
    private let viewModel: SocialDetailViewModel?
    
    override init() {
        self.viewModel = nil
        super.init()
    }
    
    public init(viewModel: SocialDetailViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
