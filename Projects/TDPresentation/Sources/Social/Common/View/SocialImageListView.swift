import UIKit
import SnapKit
import TDDesign
import Then

final class SocialImageListView: UIStackView {
    private let maxImagesToShow = 3
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(with images: [String]) {
        self.init(frame: .zero)
        setupUI()
        addImages(images: images)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addImages(images: [String]) {
        
        let displayedImages = images.prefix(maxImagesToShow)
        
        for (view, image) in zip(arrangedSubviews, displayedImages) {
            if let imageView = view as? UIImageView {
                imageView.kf.setImage(with: URL(string: image))
            }
        }
        
        setExtraImageCount(images: images)
    }
}

// MARK: Layout
private extension SocialImageListView {
    func setupUI() {
        axis = .horizontal
        distribution = .equalSpacing
        alignment = .leading
        spacing = 4
        
        setupLayout()
    }
    
    func setupLayout() {
        for _ in 0..<maxImagesToShow{
            let imageView = UIImageView().then {
                $0.contentMode = .scaleAspectFill
                $0.clipsToBounds = true
                $0.layer.cornerRadius = 4
            }
            addArrangedSubview(imageView)
            imageView.snp.makeConstraints { make in
                make.size.equalTo(self.snp.width).inset(2).dividedBy(maxImagesToShow)
            }
        }
    }
    
    func setExtraImageCount(images: [String]) {
        if images.count > maxImagesToShow {
            let extraCountLabel = TDLabel(toduckFont: .mediumBody2, alignment: .center,  toduckColor: TDColor.baseWhite)
            extraCountLabel.backgroundColor = TDColor.baseBlack.withAlphaComponent(0.3)
            
            extraCountLabel.setText("+\(images.count - maxImagesToShow)")
            
            self.arrangedSubviews.last?.addSubview(extraCountLabel)
            
            extraCountLabel.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
    }
}
