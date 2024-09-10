//
//  SelectDatesCustomFSCalendarCell.swift
//  toduck
//
//  Created by 박효준 on 8/25/24.
//

import FSCalendar
import SnapKit
import Then

final class SheetCalendarSelectDateCell: FSCalendarCell {
	let circleBackImageView = UIImageView()
	let leftRectBackImageView = UIImageView()
	let rightRectBackImageView = UIImageView()

	override init(frame: CGRect) {
		super.init(frame: frame)

		setConfigure()
		setConstraints()
		settingImageView()
	}

	required init(coder: NSCoder) {
		super.init(coder: coder)

		setConfigure()
		setConstraints()
		settingImageView()
	}

	private func setConfigure() {
		contentView.insertSubview(circleBackImageView, at: 0)
		contentView.insertSubview(leftRectBackImageView, at: 0)
		contentView.insertSubview(rightRectBackImageView, at: 0)
	}
    
	private func setConstraints() {
		// 요일 폰트를 센터로 맞춤 (디폴트는 위로 치우쳐있음)
		self.titleLabel.snp.makeConstraints {
			$0.center.equalTo(contentView)
		}

		leftRectBackImageView.snp.makeConstraints {
			$0.leading.equalTo(contentView)
			$0.trailing.equalTo(contentView.snp.centerX)
			$0.height.equalTo(46)
			$0.centerY.equalTo(contentView)
		}

		circleBackImageView.snp.makeConstraints {
			$0.center.equalTo(contentView)
			$0.size.equalTo(46)
		}

		rightRectBackImageView.snp.makeConstraints {
			$0.leading.equalTo(contentView.snp.centerX)
			$0.trailing.equalTo(contentView)
			$0.height.equalTo(46)
			$0.centerY.equalTo(contentView)
		}
	}

	private func settingImageView() {
		circleBackImageView.clipsToBounds = true
		circleBackImageView.layer.cornerRadius = 23

		[circleBackImageView, leftRectBackImageView, rightRectBackImageView].forEach {
			$0.backgroundColor = TDColor.Primary.primary50
		}
	}
}

extension SheetCalendarSelectDateCell {
	func updateBackImage(_ dateType: SelectedDateType) {
		switch dateType {
		case .singleDate:
			leftRectBackImageView.isHidden = true
			rightRectBackImageView.isHidden = true
			circleBackImageView.isHidden = false
			circleBackImageView.backgroundColor = TDColor.Primary.primary100

		case .firstDate:
			leftRectBackImageView.isHidden = true
			rightRectBackImageView.isHidden = false
			circleBackImageView.isHidden = false
			circleBackImageView.backgroundColor = TDColor.Primary.primary100

		case .middleDate:
			leftRectBackImageView.isHidden = false
			rightRectBackImageView.isHidden = false
			circleBackImageView.isHidden = true

		case .lastDate:
			rightRectBackImageView.isHidden = true
			leftRectBackImageView.isHidden = false
			circleBackImageView.isHidden = false
			circleBackImageView.backgroundColor = TDColor.Primary.primary100

		case .notSelected:
			circleBackImageView.isHidden = true
			leftRectBackImageView.isHidden = true
			rightRectBackImageView.isHidden = true
		}
	}
}
