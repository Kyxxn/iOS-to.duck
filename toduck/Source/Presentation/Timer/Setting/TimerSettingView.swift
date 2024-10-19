import UIKit

final class TimerSettingView: BaseView {

    let recommandView = TimerRecommandView()

    let exitButton = TDBaseButton(image: TDImage.X.x1Medium,backgroundColor: .clear)

    let timerSettingLabel = TDLabel(labelText: "타이머 설정", toduckFont: .mediumHeader4, alignment: .center, toduckColor: TDColor.Neutral.neutral800)

    let fieldStack = UIStackView(arrangedSubviews: [
        TimerSettingField(state: .focusTime),
        TimerSettingField(state: .restTime),
        TimerSettingField(state: .focusCount)
    ]).then {
        $0.spacing = 28
        $0.axis = .vertical
    }

    let saveButton = TDButton(title: "저장", size: .large)

    override func addview() {
        addSubview(exitButton)
        addSubview(timerSettingLabel)
        addSubview(recommandView)
        addSubview(fieldStack)
        addSubview(saveButton)
    }

    override func layout() {
        
        exitButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(24)
        }

        timerSettingLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(exitButton.snp.centerY)
        }


        recommandView.snp.makeConstraints { make in
            make.height.equalTo(86)
            make.leading.equalTo(exitButton.snp.leading)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(exitButton.snp.bottom).offset(10)
        }

        fieldStack.snp.makeConstraints { make in
            make.leading.equalTo(recommandView.snp.leading)
            make.top.equalTo(recommandView.snp.bottom).offset(10)
            make.bottom.equalTo(saveButton.snp.top).offset(-10)
            make.trailing.equalTo(recommandView.snp.trailing)
        }

        saveButton.snp.makeConstraints { make in
            make.leading.equalTo(recommandView.snp.leading)
            make.trailing.equalTo(recommandView.snp.trailing)
            //make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(16)
        }
    }
    
}

final class TimerSettingField: BaseView {
    enum TimerSettingFieldState {
        case focusTime
        case restTime
        case focusCount

        var title: String {
            switch self {
            case .focusTime:
                return "집중 시간"
            case .restTime:
                return "휴식 시간"
            case .focusCount:
                return "집중 횟수"     
            }
        }

        //아마 못 쓸듯?
        var defualtTimeValue: Int {
            switch self {
            case .focusTime:
                return 25
            case .restTime:
                return 5
            case .focusCount:
                return 4
            }
        }
        
        var TimeFormat: String {
            switch self {
            case .focusCount:
                return "회"
            case .focusTime, .restTime:
                return "분"
                
            }
        }
    }
    private let titleLabel = TDLabel(toduckFont: .mediumBody2)
    private let outputLabel = TDLabel(toduckFont: .mediumBody2)

    private let leftButton = TDBaseButton(image: TDImage.Direction.leftMedium, backgroundColor: .clear)
    private let rightButton = TDBaseButton(image: TDImage.Direction.rightMedium, backgroundColor: .clear)

    private let stack = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
    }
    
    private(set) var rawValue: Int
    
    init(state: TimerSettingFieldState) {
        rawValue = state.defualtTimeValue
        super.init(frame: .zero)
        titleLabel.text = state.title
        outputLabel.text = "\(state.defualtTimeValue)\(state.TimeFormat)"
        outputLabel.contentMode = .center
            
        leftButton.addTarget(self, action: #selector(decreaseTimer), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(increaseTimer), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func configure() {
        
    }
    
    @objc
    func increaseTimer() {
        print("right button pressed")
        rawValue += 1
        outputLabel.text = "\(rawValue)"
    }
    
    @objc
    func decreaseTimer() {
        print("left button pressed")
        rawValue -= 1
        outputLabel.text = "\(rawValue)"
    }
    
    

    override func addview() {
        addSubview(titleLabel)
        addSubview(stack)
        stack.addArrangedSubview(leftButton)
        stack.addArrangedSubview(outputLabel)
        stack.addArrangedSubview(rightButton)
    }
    
    

    override func layout() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        outputLabel.snp.makeConstraints { make in
            make.width.equalTo(40)
        }
        
        stack.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
        }

    }

    

}

final class TimerRecommandView: BaseView {

    private let fireIcon = TDImage.fireSmall

    private let fireImageView = UIImageView()

    private let titleLabel = TDLabel(labelText: "토덕의 추천 설정", toduckFont: .boldBody2)

    private let recommandStack = UIStackView().then { 
        $0.spacing = 4
        $0.axis = .horizontal
        $0.distribution = .fillProportionally
        $0.alignment = .center
    }


    override func addview() {
        addSubview(fireImageView)
        addSubview(titleLabel)
        addSubview(recommandStack)
    }


    override func configure() {
        backgroundColor = TDColor.Neutral.neutral50
        layer.cornerRadius = 10
        fireImageView.image = fireIcon
        
        // TODO: 문법상 괜찮은지 확인하기
        [TDBadge(badgeTitle: "집중 횟수 4회", backgroundColor: TDColor.Neutral.neutral200, foregroundColor: TDColor.Neutral.neutral600),
         TDBadge(badgeTitle: "집중 시간 25분", backgroundColor: TDColor.Neutral.neutral200, foregroundColor: TDColor.Neutral.neutral600),
         TDBadge(badgeTitle: "휴식 시간 5분", backgroundColor: TDColor.Neutral.neutral200, foregroundColor: TDColor.Neutral.neutral600)
        ].forEach { badge in
            recommandStack.addArrangedSubview(badge)
        }
    }

    override func layout() {
        fireImageView.snp.makeConstraints { make in
            //make.width.height.equalTo(24)
            make.leading.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(16)
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(fireImageView.snp.trailing).offset(4)
            make.top.equalTo(fireImageView.snp.top)
            make.bottom.equalTo(fireImageView.snp.bottom)

        }

        recommandStack.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.leading.equalTo(titleLabel.snp.leading)
            //make.trailing.equalToSuperview().offset(-32)
            //make.height.equalTo(24)
        }
        

    }
}   


