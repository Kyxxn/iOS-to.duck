import UIKit
import SnapKit

final class SocialRoutineView: UIView {
    private var routineTitleLabel = TDLabel(toduckFont: .boldBody1, toduckColor: TDColor.Neutral.neutral800).then {
        $0.numberOfLines = 2
    }
    
    private var routineContentLabel = TDLabel(toduckFont: .regularBody2, toduckColor: TDColor.Neutral.neutral800).then{
        $0.numberOfLines = 0
    }
    
    private var routineDateLabel = TDLabel(toduckFont: .mediumBody2, toduckColor: TDColor.Neutral.neutral500)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(with routine: Routine) {
        self.init()
        self.routineTitleLabel.setText(routine.title)
        self.routineContentLabel.setText(routine.memo ?? "")
        if let routineDate = routine.dateAndTime {
            routineDateLabel.setText(routineDate.convertToString(formatType: .time12HourEnglish))
        }
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
}

// MARK: Layout
private extension SocialRoutineView {
    
    func setupUI() {
        backgroundColor = TDColor.Neutral.neutral100
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    
    func setupLayout() {
        [routineTitleLabel, routineContentLabel, routineDateLabel].forEach {
            addSubview($0)
        }
        
        routineTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(24)
        }
        
        routineContentLabel.snp.makeConstraints { make in
            make.top.equalTo(routineTitleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(routineTitleLabel)
        }
        
        routineDateLabel.snp.makeConstraints { make in
            make.top.equalTo(routineContentLabel.snp.bottom).offset(18)
            make.trailing.leading.equalTo(routineTitleLabel)
            make.bottom.equalToSuperview().inset(14)
            make.height.equalTo(24)
         }
    }
}
