//
//  TDTimerButton.swift
//  TDDesign
//
//  Created by 승재 on 10/20/24.
//
import UIKit

public final class TDTimerButton: TDBaseButton {
    private let outlineColor: UIColor
    private let icon: UIImage
    public init(_ state: TimerButtonState) {
        icon = state.icon
        outlineColor = state.outlineColor
        icon.withTintColor(state.foregroundColor, renderingMode: .alwaysOriginal)
        super.init(image: icon,backgroundColor: state.backgroundColor, foregroundColor: state.foregroundColor,radius: 40)
    }

    public override func layout() {
        snp.makeConstraints {
            $0.width.height.equalTo(80)
        }
    }

    public override func setupButton() {
        layer.borderWidth = 5
        layer.borderColor = outlineColor.cgColor
        super.setupButton()
    }
}

public enum TimerButtonState {
    case play
    case pause
    case stop
    case reset

    var icon: UIImage {
        switch self {
        case .play:
            return TDImage.Timer.play.withRenderingMode(.alwaysTemplate)
        case .pause:
            return TDImage.Timer.pause.withRenderingMode(.alwaysTemplate)
        case .stop:
            return TDImage.Timer.stop.withRenderingMode(.alwaysTemplate)
        case .reset:
            return TDImage.Timer.reset.withRenderingMode(.alwaysTemplate)
        }
    }

    var backgroundColor: UIColor {
        return UIColor(white: 1, alpha: 0.3)
    }

    var foregroundColor: UIColor {
        return .white
    }

    var outlineColor: UIColor {
        return UIColor(white: 1, alpha: 0.5)
    }
}
