//
//  Emotion.swift
//  toduck
//
//  Created by 승재 on 6/11/24.
//

import Foundation

public enum Emotion: String, CaseIterable, Hashable {
    case happy = "행복"
    case soso = "평온"
    case sad = "슬픔"
    case angry = "화남"
    case anxious = "불안"
    case tired = "피곤"
    
    public var imageName: String {
        switch self {
        case .happy:
            return "happy_image"
        case .soso:
            return "calm_image"
        case .sad:
            return "sad_image"
        case .angry:
            return "angry_image"
        case .anxious:
            return "anxious_image"
        case .tired:
            return "tired_image"
        }
    }
}
