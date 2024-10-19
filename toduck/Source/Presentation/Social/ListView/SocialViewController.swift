import Combine
import UIKit

class SocialViewController: BaseViewController<SocialView>, TDSheetPresentation {
    weak var coordinator: SocialCoordinator?
    private let searchBar = UISearchBar()
    private var filteredPosts: [Post] = []
    private var datasource: UICollectionViewDiffableDataSource<Int, Post.ID>?
    private let viewModel: SocialViewModel!
    private var cancellables = Set<AnyCancellable>()
    
    let chips: [TDChipItem] = [
        TDChipItem(title: "집중력"),
        TDChipItem(title: "기억력"),
        TDChipItem(title: "충돌"),
        TDChipItem(title: "불안"),
        TDChipItem(title: "수면"),
    ]
    
    init(viewModel: SocialViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = nil
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configure() {
        layoutView.socialFeedCollectionView.delegate = self
        layoutView.socialFeedCollectionView.refreshControl = layoutView.refreshControl
        layoutView.chipCollectionView.chipDelegate = self
        layoutView.chipCollectionView.setChips(chips)
        setupDataSource()
        layoutView.dropDownFilterHoverView.dataSource = SocialSortType.allCases.map { $0.rawValue }
        layoutView.dropDownFilterHoverView.delegate = self
        layoutView.refreshControl.addTarget(self, action: #selector(didRefresh), for: .valueChanged)
        viewModel.action(.fetchPosts)
    }
    
    override func addView() {
        
    }
    
    override func layout() {
        
    }
    
    override func binding() {
        viewModel.fetchState.sink { [weak self] state in
            switch state {
            case .loading:
                self?.layoutView.showLoadingView()
            case .finish(let posts):
                self?.layoutView.showFinishView()
                DispatchQueue.main.async {
                    self?.applySnapshot(posts)
                }
            case .empty:
                self?.layoutView.showEmptyView()
            case .error:
                self?.layoutView.showErrorView()
            }
        }.store(in: &cancellables)
        
        viewModel.likeState.sink { [weak self] state in
            switch state {
            case .finish(let post):
                DispatchQueue.main.async {
                    self?.updateSnapshot(post)
                }
            case .error:
                self?.layoutView.showEmptyView()
            }
        }.store(in: &cancellables)
    }
}


extension SocialViewController: TDChipCollectionViewDelegate {
    func chipCollectionView(_ collectionView: TDChipCollectionView, didSelectChipAt index: Int, chipText: String) {
        print("[LOG] 현재 Select 한 Chip: \(chipText) , Index = : \(index)")
        layoutView.hideDropdown()
    }
}

extension SocialViewController: UICollectionViewDelegate {
    
    private func setupDataSource() {
        datasource = .init(collectionView: layoutView.socialFeedCollectionView, cellProvider: { collectionView, indexPath, postID in
            guard let post = self.viewModel.post(id: postID) else { return UICollectionViewCell() }
            let cell: SocialFeedCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.socialFeedCellDelegate = self
            cell.configure(with: post)
            
            return cell
        })
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator?.moveToSocialDetailController(by: indexPath.item)
    }
}

//MARK: Input
extension SocialViewController: SocialFeedCollectionViewCellDelegate, TDDropDownDelegate {
    func dropDown(_ dropDownView: TDDropdownHoverView, didSelectRowAt indexPath: IndexPath) {
        let option = SocialSortType.allCases[indexPath.row]
        layoutView.dropDownFilterView.setTitle(option.rawValue)
        viewModel.action(.sortPost(by: option))
    }
    
    @objc func didRefresh() {
        viewModel.action(.fetchPosts)
    }
    
    func didTapNickname(_ cell: SocialFeedCollectionViewCell) {
        
    }

    func didTapMoreButton(_ cell: SocialFeedCollectionViewCell) {
    
    }
    
    func didTapCommentButton(_ cell: SocialFeedCollectionViewCell) {
        print("[LOG] Comment Button Clicked")
    }

    func didTapShareButton(_ cell: SocialFeedCollectionViewCell) {
        print("[LOG] Share Button Clicked")
    }

    func didTapLikeButton(_ cell: SocialFeedCollectionViewCell) {
        print("[LOG] Like Button Clicked")
        guard let indexPath = layoutView.socialFeedCollectionView.indexPath(for: cell) else {
            return
        }
        viewModel.action(.likePost(at: indexPath.item))
    }
}

// MARK: Collection View Datasource Apply
extension SocialViewController {
    private func applySnapshot(_ posts: [Post]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Post.ID>()
        snapshot.appendSections([0])
        snapshot.appendItems(posts.map { $0.id })
        datasource?.apply(snapshot, animatingDifferences: true)
    }
    
    private func updateSnapshot(_ post: Post) {
        var snapshot = datasource?.snapshot()
        snapshot?.reloadItems([post.id])
        datasource?.apply(snapshot!, animatingDifferences: true)
    }
}
