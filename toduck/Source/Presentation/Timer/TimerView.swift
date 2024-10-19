import UIKit

final class TimerView: BaseView {

    //TODO: 이름 다시 생각
    let dailyChargedLabel = TDLabel(labelText: "Today 00H 00M", toduckFont: .regularBody2)

    let timerLabel = TDLabel(labelText: "00:00", toduckFont: .boldHeader1)

    let timerStack = UIStackView().then {
        $0.spacing = 0
        $0.axis = .vertical
        $0.alignment = .center
    }

    let timerItem: TimerItemView = TimerItemView(currentCount: 1)

    
    let toast = TDToast(foregroundColor: TDColor.Semantic.success, titleText: "집중 타임 종료  🙌🏻",contentText: "잘했어요 ! 이대로 집중하는 습관을 천천히 길러봐요 !")
    let toast2 = TDToast(foregroundColor: TDColor.Primary.primary500, titleText: "휴식 시간 끝 💡️", contentText: "집중할 시간이에요 ! 자리에 앉아볼까요?")

    let playBtn = TDTimerButton(.play)
    let resetBtn = TDTimerButton(.reset)
    let stopBtn = TDTimerButton(.stop)

    let button = TDButton(title: "테스트",size: .large)


    override func addview() {
        addSubview(timerStack)
        
        addSubview(playBtn)
        addSubview(resetBtn)
        addSubview(stopBtn)

        addSubview(toast)
        addSubview(toast2)

        addSubview(timerItem)
        timerStack.addArrangedSubview(dailyChargedLabel)
        timerStack.addArrangedSubview(timerLabel)
        
        addSubview(button)

        timerItem.setCurrentCount(3)
    }

    override func configure() {
        backgroundColor = .white

    }

    override func layout() {
        timerStack.snp.makeConstraints { 
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(100)
        }

        timerItem.snp.makeConstraints { 
            $0.top.equalTo(timerStack.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
        }

        resetBtn.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-140)
        }

        playBtn.snp.makeConstraints {
            $0.trailing.equalTo(resetBtn.snp.leading).offset(-20)
            $0.centerY.equalTo(resetBtn)
        }

        stopBtn.snp.makeConstraints {
            $0.leading.equalTo(resetBtn.snp.trailing).offset(20)
            $0.centerY.equalTo(resetBtn)
        }
        
        toast.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalToSuperview().inset(20)
        }

        toast2.snp.makeConstraints {
            $0.top.equalTo(toast.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().inset(20)
        }

        button.snp.makeConstraints { 
            $0.bottom.equalTo(resetBtn.snp.top).offset(-20)
            $0.centerX.equalToSuperview()
        }   
    }
}
