import UIKit

struct TDChipItem {
    var title: String
    var leftImage: UIImage? = nil
    var rightImage: UIImage? = nil
}

protocol TDChipCollectionViewDelegate: AnyObject {
    func chipCollectionView(_ collectionView: TDChipCollectionView, didSelectChipAt index: Int, chipText: String)
}

class TDChipCollectionView: UICollectionView {
 
    private var chips: [TDChipItem] = []
    private var selectedStates: [Bool] = []
    private var defaultChipType: TDChipType
    private var hasAllSelectChip: Bool = false
    private var isMultiSelect: Bool = false
    weak var chipDelegate: TDChipCollectionViewDelegate?
    
    init(chipType: TDChipType, hasAllSelectChip: Bool = false, isMultiSelect: Bool = false) {
        self.hasAllSelectChip = hasAllSelectChip
        self.isMultiSelect = isMultiSelect
        self.defaultChipType = chipType
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        if hasAllSelectChip {
            self.chips.insert(TDChipItem(title: "전체", leftImage: TDImage.hamburgerMedium), at: 0)
            self.selectedStates.insert(true, at: 0)
        }
        super.init(frame: .zero, collectionViewLayout: layout)
        self.backgroundColor = .clear
        self.delegate = self
        self.dataSource = self
        self.register(with: TDChipCell.self)
        self.showsHorizontalScrollIndicator = false
        self.allowsSelection = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setChips(_ chips: [TDChipItem]) {
        self.chips.append(contentsOf: chips)
        self.selectedStates.append(contentsOf: Array(repeating: false, count: chips.count))
        self.reloadData()
    }
}

extension TDChipCollectionView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chips.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TDChipCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(item: chips[indexPath.item], chipType: defaultChipType, isActive: selectedStates[indexPath.item])
        return cell
    }
}

extension TDChipCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = chips[indexPath.item].title
        var width = (text as NSString).size(withAttributes: [NSAttributedString.Key.font: TDFont.regularBody2.font]).width
        width += (chips[indexPath.item].leftImage != nil) ? 24 : 0
        width += (chips[indexPath.item].rightImage != nil) ? 24 : 0
        return CGSize(width: width + 24, height: defaultChipType.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? TDChipCell else { return }
        
        let chip = chips[indexPath.item]
        
        
        // "전체" 칩이 선택되었을 때 처리
        if hasAllSelectChip{
            if isMultiSelect{
                // 전체 누른 경우
                if indexPath.item == 0 {
                    selectedStates = Array(repeating: false, count: chips.count)
                    selectedStates[0] = true
                } else {
                    selectedStates[0] = false
                    selectedStates[indexPath.item].toggle()
                }
            }else {
                // 전체를 누른 경우
                if indexPath.item == 0 {
                    selectedStates = Array(repeating: false, count: chips.count)
                    selectedStates[0] = true
                } else {
                    selectedStates = Array(repeating: false, count: chips.count)
                    selectedStates[indexPath.item] = true
                }
            }
        } else {
            if isMultiSelect {
                selectedStates[indexPath.item].toggle()
            } else {
                selectedStates = Array(repeating: false, count: chips.count)
                selectedStates[indexPath.item] = true
            }
        }
        chipDelegate?.chipCollectionView(self, didSelectChipAt: indexPath.item, chipText: chip.title)
        collectionView.reloadData()
    }
}


