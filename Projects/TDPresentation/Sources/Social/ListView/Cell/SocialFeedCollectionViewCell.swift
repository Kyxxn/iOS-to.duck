import SnapKit
import TDDesign
import TDDomain
import Then
import Kingfisher
import UIKit

protocol SocialFeedCollectionViewCellDelegate: AnyObject {
    func didTapLikeButton(_ cell: SocialFeedCollectionViewCell)
    func didTapMoreButton(_ cell: SocialFeedCollectionViewCell)
    func didTapNickname(_ cell: SocialFeedCollectionViewCell)
}

class SocialFeedCollectionViewCell: UICollectionViewCell {
    private let containerView = UIView()
    weak var socialFeedCellDelegate: SocialFeedCollectionViewCellDelegate?
    
    private var verticalStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 14
        $0.distribution = .fill
    }
    
    private var headerStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private var headerLeftStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .leading
        $0.spacing = 10
        $0.distribution = .equalSpacing
    }
    
    private var headerRightStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.spacing = 10
        $0.distribution = .equalSpacing
    }
    
    lazy var dotIconView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = TDImage.Dot.vertical2Small
    }
    
    private var bodyStackView = UIStackView().then{
        $0.axis = .vertical
        $0.spacing = 14
        $0.alignment = .fill
        $0.distribution = .fill
    }
    
    lazy var avatarView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 18
        $0.backgroundColor = TDColor.Neutral.neutral100
    }
    
    private var titleBagde = TDBadge(badgeTitle: "",backgroundColor: TDColor.Primary.primary25, foregroundColor: TDColor.Primary.primary500)
    
    private var nicknameLabel = TDLabel(toduckFont: .mediumBody2, toduckColor: TDColor.Neutral.neutral700)
    
    private var dateLabel = TDLabel(toduckFont: .regularBody2, toduckColor: TDColor.Neutral.neutral500)
    
    private var contentLabel = TDLabel(toduckFont: .mediumBody2, toduckColor: TDColor.Neutral.neutral800).then {
        $0.numberOfLines = 0
    }
    
    lazy private var footerView = SocialFooterView(isLike: false, likeCount: nil, commentCount: nil, shareCount: nil).then {
        $0.delegate = self
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // TODO: Presentation Model
    func configure(with item: Post) {
        titleBagde.setTitle(item.user.title)
        nicknameLabel.setText(item.user.name)
        dateLabel.setText(item.timestamp.convertRelativeTime())
        contentLabel.setText(item.contentText)
        
        footerView.configure(isLike: item.isLike, likeCount: item.likeCount, commentCount: item.commentCount, shareCount: item.shareCount)
        
        configureUserImage(with: item.user.icon)
        configureRoutine(with: item.routine)
        configureImageList(with: item.imageList)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleBagde.setTitle("")
        nicknameLabel.setText("")
        dateLabel.setText("")
        contentLabel.setText("")
        avatarView.image = TDImage.Profile.medium
        
        bodyStackView.arrangedSubviews.forEach {
            if $0 is SocialRoutineView || $0 is SocialImageListView {
                $0.removeFromSuperview()
            }
        }
    }
}
// MARK: Layout
private extension SocialFeedCollectionViewCell {
    
    func setupUI() {
        setupLayout()
        setupConstraints()
    }
    
    func setupLayout() {
        addSubview(containerView)
        [avatarView, verticalStackView].forEach{
            containerView.addSubview($0)
        }
        [titleBagde,nicknameLabel,dateLabel].forEach{
            headerLeftStackView.addArrangedSubview($0)
        }
        headerRightStackView.addArrangedSubview(dotIconView)
        
        [headerLeftStackView,headerRightStackView].forEach{
            headerStackView.addArrangedSubview($0)
        }
        bodyStackView.addArrangedSubview(contentLabel)
        [headerStackView, bodyStackView, footerView].forEach{
            verticalStackView.addArrangedSubview($0)
        }
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
            make.leading.trailing.equalToSuperview()
        }
        
        avatarView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.size.equalTo(36)
        }
        
        bodyStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        
        [titleBagde, nicknameLabel, dateLabel, dotIconView].forEach {
            $0.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
            }
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.leading.equalTo(avatarView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        headerStackView.snp.makeConstraints { make in
            make.height.equalTo(24)
        }
        
        footerView.snp.makeConstraints { make in
            make.height.equalTo(24)
        }
        
        dotIconView.snp.makeConstraints { make in
            make.size.equalTo(24)
        }
    }
}

//MARK: Priavte Method
extension SocialFeedCollectionViewCell {
    private func configureUserImage(with image: String?) {
        if let image = image {
            avatarView.kf.setImage(with: URL(string: image))
        } else {
            avatarView.image = TDImage.Profile.medium
        }
    }
    
    private func configureRoutine(with routine: Routine?) {
        if let routine = routine {
            bodyStackView.addArrangedSubview(SocialRoutineView(with: routine))
        }
    }
    
    private func configureImageList(with imageList: [String]?) {
        if let imageList = imageList {
            bodyStackView.addArrangedSubview(SocialImageListView(with: imageList))
        }
    }
}

//MARK: Delegate
extension SocialFeedCollectionViewCell: SocialFooterDelegate {
    @objc func didSelectLikeButton() {
        socialFeedCellDelegate?.didTapLikeButton(self)
    }
    @objc func didSelectMoreButton() {
        socialFeedCellDelegate?.didTapMoreButton(self)
    }
}
