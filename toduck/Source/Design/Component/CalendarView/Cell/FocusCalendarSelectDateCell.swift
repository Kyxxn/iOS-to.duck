//
//  FocusCalendarSelectDateCell.swift
//  toduck
//
//  Created by 박효준 on 9/8/24.
//

import FSCalendar
import SnapKit
import Then

final class FocusCalendarSelectDateCell: FSCalendarCell {
    var backImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        setConstraints()
    }
    
    private func setConstraints() {
        // 요일 폰트를 센터로 맞춤 (디폴트는 위로 치우쳐있음)
        self.titleLabel.snp.makeConstraints {
            $0.center.equalTo(contentView)
        }
        contentView.insertSubview(backImageView, at: 0)
        backImageView.snp.makeConstraints {
            $0.center.equalTo(contentView)
            $0.size.equalTo(minSize())
        }
        backImageView.layer.cornerRadius = minSize() / 2
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        backImageView.image = nil
    }
    
    // 셀의 높이와 너비 중 작은 값을 리턴한다
    func minSize() -> CGFloat {
        let width = contentView.bounds.width - 5
        let height = contentView.bounds.height - 5

        return (width > height) ? height : width
    }
}
