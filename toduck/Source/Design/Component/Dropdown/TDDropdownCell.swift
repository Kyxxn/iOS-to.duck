import UIKit
import SnapKit

final class DropDownCell: UITableViewCell {
    static let identifier = "DropDownCell"
    
    override var isSelected: Bool {
        didSet {
            contentView.backgroundColor = isSelected ? TDColor.Neutral.neutral300 : TDColor.baseWhite
        }
    }
    
    private let stackView = UIStackView().then {
        $0.spacing = 5
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .equalSpacing
    }
    
    // MARK: - UI Components
    private let optionLabel = TDLabel(labelText: "", toduckFont: TDFont.boldBody2, alignment: .center, toduckColor: TDColor.Neutral.neutral800)
    
    private let leftImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    private let rightImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        leftImageView.image = nil
        rightImageView.image = nil
    }
    
    // MARK: - Configure
    func configure(with text: String, leftImage: UIImage? = nil, rightImage: UIImage? = nil) {
        if let leftImage = leftImage {
            leftImageView.image = leftImage
            stackView.addArrangedSubview(leftImageView)
        }
        optionLabel.setText(text)
        stackView.addArrangedSubview(optionLabel)
        
        if let rightImage = rightImage {
            rightImageView.image = rightImage
            stackView.addArrangedSubview(rightImageView)
        }
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
        contentView.addSubview(stackView)
    }
    
    func setConstraints() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }
    }
}
