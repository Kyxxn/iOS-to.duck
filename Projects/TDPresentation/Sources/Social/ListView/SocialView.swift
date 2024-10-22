import SnapKit
import TDDesign
import Then
import UIKit

final class SocialView: BaseView {
    private(set) lazy var chipCollectionView = TDChipCollectionView(chipType: .roundedRectangle, hasAllSelectChip: true, isMultiSelect: false)
    private(set) lazy var socialFeedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCollectionViewLayout()).then {
        $0.backgroundColor = TDColor.baseWhite
    }
    
    private let dropDownDataSource: [SocialSortType] = [.recent, .comment, .sympathy]
    
    private(set) lazy var dropDownFilterView = SocialDropdownView(title: dropDownDataSource[0].rawValue)
    private(set) lazy var dropDownFilterHoverView = TDDropdownHoverView(anchorView: dropDownFilterView, selectedOption: dropDownDataSource[0].rawValue, layout: .leading, width: 100)
    
    private(set) lazy var refreshControl = UIRefreshControl().then {
        $0.tintColor = .systemGray
    }
    private let loadingView = UIView().then {
        $0.backgroundColor = TDColor.baseWhite
    }
    
    override func layout() {
        dropDownFilterHoverView.snp.makeConstraints { make in
            make.width.equalTo(65)
            make.height.equalTo(30)
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalTo(safeAreaLayoutGuide).offset(16)
        }
        
        chipCollectionView.snp.makeConstraints { make in
            make.height.equalTo(33)
            make.top.equalTo(dropDownFilterView)
            make.leading.equalTo(dropDownFilterView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        
        socialFeedCollectionView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(chipCollectionView.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        loadingView.snp.makeConstraints { make in
            make.edges.equalTo(socialFeedCollectionView)
        }
    }
    
    override func configure() {
        backgroundColor = .white
        socialFeedCollectionView.register(with: SocialFeedCollectionViewCell.self)
    }
    
    override func addview() {
        [dropDownFilterHoverView, chipCollectionView, socialFeedCollectionView, loadingView].forEach {
            addSubview($0)
        }
    }
    
    override func binding() {
        
    }
}

// MARK: External Method
extension SocialView {
    func showLoadingView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.refreshControl.endRefreshing()
            UIView.animate(withDuration: 0.5) {
                self.loadingView.alpha = 1
            }
        }
    }
    
    func showFinishView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.refreshControl.endRefreshing()
            UIView.animate(withDuration: 0.5) {
                self.loadingView.alpha = 0
            }
        }
    }
    
    func showEmptyView() {
        
    }
    
    func showErrorView() {
        
    }
    
    func hideDropdown() {
        dropDownFilterHoverView.hideDropDown()
    }
}

private extension SocialView{
    func makeCollectionViewLayout() -> UICollectionViewLayout {
        let itemPadding: CGFloat = 10
        let groupPadding: CGFloat = 16
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(500)
        )
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(500)
        )
        
        let edgeSpacing = NSCollectionLayoutEdgeSpacing(
            leading: .fixed(0),
            top: .fixed(itemPadding),
            trailing: .fixed(0),
            bottom: .fixed(itemPadding)
        )
        
        let groupInset = NSDirectionalEdgeInsets(
            top: 0,
            leading: groupPadding,
            bottom: 0,
            trailing: groupPadding
        )
        
        return UICollectionViewCompositionalLayout.makeVerticalCompositionalLayout(
            itemSize: itemSize,
            itemEdgeSpacing: edgeSpacing,
            groupSize: groupSize,
            groupInset: groupInset
        )
    }
}
