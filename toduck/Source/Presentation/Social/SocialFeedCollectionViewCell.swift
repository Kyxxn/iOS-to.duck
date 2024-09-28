//
//  SocialFeedCollectionViewCell.swift
//  toduck
//
//  Created by 승재 on 8/3/24.
//
import SnapKit
import Then
import Kingfisher
import UIKit

protocol SocialFeedCollectionViewCellDelegate: AnyObject {
    func didTapLikeButton(_ cell: SocialFeedCollectionViewCell)
    func didTapCommentButton(_ cell: SocialFeedCollectionViewCell)
    func didTapShareButton(_ cell: SocialFeedCollectionViewCell)
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
    
    private var headerLeftStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private var headerRightStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.spacing = 10
        $0.distribution = .equalSpacing
    }
    
    private var bodyStackView = UIStackView().then{
        $0.axis = .vertical
        $0.spacing = 14
        $0.alignment = .fill
        $0.distribution = .fill
    }
    
    private let footerView = UIView()
    
    lazy var dotIconView = UIImageView().then {
        $0.tintColor = TDColor.Neutral.neutral500
        $0.contentMode = .scaleAspectFit
        $0.image = TDImage.Dot.horizontalMedium.withRenderingMode(.alwaysTemplate)
    }
    
    lazy var likeButton = UIButton().then {
        $0.tintColor = TDColor.Neutral.neutral500
        $0.contentMode = .scaleAspectFit
        $0.addTarget(self, action: #selector(didSelectLikeButton), for: .touchUpInside)
    }
    
    lazy var commentIconView = UIImageView().then {
        $0.tintColor = TDColor.Neutral.neutral500
        $0.contentMode = .scaleAspectFit
        $0.image = TDImage.Comment.leftMedium.withRenderingMode(.alwaysTemplate)
    }
    
    lazy var shareIconView = UIImageView().then {
        $0.tintColor = TDColor.Neutral.neutral500
        $0.contentMode = .scaleAspectFit
        $0.image = TDImage.Repeat.arrowMedium.withRenderingMode(.alwaysTemplate)
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
    
    private var likeLabel = TDLabel(toduckFont: .regularBody2, toduckColor: TDColor.Neutral.neutral600)
    
    private var commentLabel = TDLabel(toduckFont: .regularBody2, toduckColor: TDColor.Neutral.neutral600)
    private var shareLabel = TDLabel(toduckFont: .regularBody2, toduckColor: TDColor.Neutral.neutral600)
    
    private var routineStackView = UIStackView().then{
        $0.backgroundColor = TDColor.Neutral.neutral100
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.axis = .vertical
        $0.spacing = 10
        $0.alignment = .fill
        $0.distribution = .fill
    }
    
    private var routineTitleLabel = TDLabel(toduckFont: .boldBody1, toduckColor: TDColor.Neutral.neutral800).then {
        $0.numberOfLines = 2
    }
    
    private var routineContentLabel = TDLabel(toduckFont: .regularBody2, toduckColor: TDColor.Neutral.neutral800).then{
        $0.numberOfLines = 0
    }
    
    private var routineDateLabel = TDLabel(toduckFont: .mediumBody2, toduckColor: TDColor.Neutral.neutral500)
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func configure(with item: Post) {
        titleBagde.setTitle(item.user.title)
        nicknameLabel.setText(item.user.name)
        
        dateLabel.setText(item.timestamp.convertRelativeTime())
        contentLabel.setText(item.contentText)
        likeLabel.setText("\(item.likeCount ?? 0)")
        commentLabel.setText("\(item.commentCount ?? 0)")
        likeButton.setImage(item.isLike ?
                            TDImage.Like.filledMedium.withRenderingMode(.alwaysOriginal) :
                            TDImage.Like.emptyMedium.withRenderingMode(.alwaysTemplate), for: .normal)
        
        
        guard let url = URL(string: item.user.icon) else { return }
        // lloadImage 수정 필요
        loadImages(url: url)
        
        
        if let shareCount = item.shareCount, shareCount > 0 {
            shareLabel.setText("\(shareCount)")
        } else {
            shareIconView.isHidden = true
            shareLabel.isHidden = true
        }
        
        if let routine = item.routine {
            bodyStackView.addArrangedSubview(routineStackView)
            routineTitleLabel.setText(routine.title)
            routineContentLabel.setText(routine.memo ?? "")
            if let routineDate = routine.dateAndTime {
                routineDateLabel.setText(routineDate.convertToString(formatType: .time12HourEnglish))
            }
            setupRoutineView()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        likeButton.setImage(TDImage.Like.emptyMedium.withRenderingMode(.alwaysTemplate), for: .normal)
        likeLabel.setText("0")
        commentLabel.setText("0")
        shareLabel.setText("0")
        routineStackView.removeFromSuperview()
        shareIconView.isHidden = false
        shareLabel.isHidden = false
        avatarView.image = TDImage.Profile.medium
    }
}
private extension SocialFeedCollectionViewCell {
    
    func setupUI() {
        setupLayout()
    }
    
    func loadImages(url: URL) {
        avatarView.image = TDImage.Profile.medium
    }
    
    func setupLayout() {
        addSubview(containerView)
        [titleBagde,nicknameLabel,dateLabel].forEach{
            headerLeftStackView.addArrangedSubview($0)
        }
        
        headerRightStackView.addArrangedSubview(dotIconView)
        
        [headerLeftStackView,headerRightStackView].forEach{
            headerStackView.addArrangedSubview($0)
        }
        
        bodyStackView.addArrangedSubview(contentLabel)
        
        [avatarView, verticalStackView].forEach{
            containerView.addSubview($0)
        }
        
        [headerStackView, bodyStackView, footerView].forEach{
            verticalStackView.addArrangedSubview($0)
        }
        
        [likeButton, likeLabel, commentIconView, commentLabel, shareIconView, shareLabel].forEach{
            footerView.addSubview($0)
        }
        
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
            make.leading.trailing.equalToSuperview()
        }
        
        
        avatarView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.size.equalTo(36)
        }
        [titleBagde, nicknameLabel, dateLabel, dotIconView, likeButton,likeLabel,commentIconView,commentLabel,shareIconView,shareLabel].forEach {
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
        likeButton.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.size.equalTo(24)
        }
        
        likeLabel.snp.makeConstraints { make in
            make.leading.equalTo(likeButton.snp.trailing).offset(2)
            make.centerY.equalTo(likeButton)
        }
        
        commentIconView.snp.makeConstraints { make in
            make.leading.equalTo(likeLabel.snp.trailing).offset(10)
            make.size.equalTo(24)
        }
        
        commentLabel.snp.makeConstraints { make in
            make.leading.equalTo(commentIconView.snp.trailing).offset(2)
            make.centerY.equalTo(commentIconView)
        }
        
        shareIconView.snp.makeConstraints { make in
            make.leading.equalTo(commentLabel.snp.trailing).offset(10)
            make.size.equalTo(24)
        }
        
        shareLabel.snp.makeConstraints { make in
            make.leading.equalTo(shareIconView.snp.trailing).offset(2)
            make.centerY.equalTo(shareIconView)
        }
        
    }
    
    
    func setupRoutineView() {
        
        bodyStackView.addArrangedSubview(routineStackView)
        routineStackView.snp.makeConstraints { make in
            make.leading.equalTo(verticalStackView.snp.leading)
            make.trailing.equalToSuperview()
        }

        [routineTitleLabel, routineContentLabel, routineDateLabel].forEach {
            routineStackView.addArrangedSubview($0)
        }
        
        routineStackView.layoutMargins = UIEdgeInsets(top: 14, left: 16, bottom: 14, right: 16)
        routineStackView.isLayoutMarginsRelativeArrangement = true
        

    }
}

// Delegate 처리
extension SocialFeedCollectionViewCell {
    @objc func didSelectLikeButton() {
        socialFeedCellDelegate?.didTapLikeButton(self)
    }
    
    @objc func didSelectCommentButton() {
        socialFeedCellDelegate?.didTapCommentButton(self)
    }
    
    @objc func didSelectShareButton() {
        socialFeedCellDelegate?.didTapShareButton(self)
    }
}
