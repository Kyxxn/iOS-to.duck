import UIKit
import SnapKit

final class DropDownCell: UITableViewCell {
    static let identifier = "DropDownCell"
    
    override var isSelected: Bool {
        didSet {
            contentView.backgroundColor = isSelected ? TDColor.Neutral.neutral300 : TDColor.baseWhite
        }
    }
    
    // MARK: - UI Components
    private let optionLabel = TDLabel(labelText: "", toduckFont: TDFont.boldBody2, alignment: .center, toduckColor: TDColor.Neutral.neutral800)
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    func configure(with text: String) {
        optionLabel.setText(text)
    }
}

// MARK: - UI Methods
private extension DropDownCell {
    func setupUI() {
        self.selectionStyle = .none
        setViewHierarchy()
        setConstraints()
    }
    
    func setViewHierarchy() {
        contentView.addSubview(optionLabel)
    }
    
    func setConstraints() {
        optionLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }
    }
}
