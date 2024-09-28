import SnapKit
import UIKit

class SocialView: BaseView {
    
    private(set) lazy var chipCollectionView = TDChipCollectionView(chipType: .roundedRectangle, hasAllSelectChip: true, isMultiSelect: false)
    private(set) lazy var socialFeedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCollectionViewLayout()).then {
        $0.backgroundColor = TDColor.baseWhite
    }
    
    private let dataSource = ["최신순", "댓글순", "공감순"]
    private let dropDownButton = SocialDropdownButton(title: "최신순")
    private lazy var dropDownView = TDDropdownView(anchorView: dropDownButton, selectedOption: "최신순", layout: .leading, width: 100)
    
    override func layout() {
        dropDownView.snp.makeConstraints { make in
            make.width.equalTo(65)
            make.height.equalTo(30)
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalTo(safeAreaLayoutGuide).offset(16)
        }
        
        chipCollectionView.snp.makeConstraints { make in
            make.height.equalTo(33)
            make.top.equalTo(dropDownButton)
            make.leading.equalTo(dropDownButton.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        
        socialFeedCollectionView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(chipCollectionView.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    override func configure() {
        backgroundColor = .white
    }
    
    override func addview() {
        [dropDownView, chipCollectionView, socialFeedCollectionView].forEach {
            addSubview($0)
        }
    }
    
    override func binding() {
        dropDownView.dataSource = dataSource
        dropDownView.delegate = self
    }
}

// MARK: Method
extension SocialView {
    func hideDropdown() {
        dropDownView.hideDropDown()
    }
}

extension SocialView : TDDropDownDelegate {
    
    func dropDown(_ dropDownView: TDDropdownView, didSelectRowAt indexPath: IndexPath) {
        let title = dropDownView.dataSource[indexPath.row]
        dropDownButton.setTitle(title)
    }
}

private extension SocialView{
    func makeCollectionViewLayout() -> UICollectionViewLayout {
        let itemPadding: CGFloat = 10
        let groupPadding: CGFloat = 16
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(300)
        )
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(300)
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
