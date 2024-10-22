//
//  Focus.swift
//  toduck
//
//  Created by 승재 on 6/3/24.
//

import Foundation

public struct Focus : Hashable{
    public let focusPercent: Int
    public let focusTime: Time
    
    public init(
        focusPercent: Int,
        focusTime: Time
    ) {
        self.focusPercent = focusPercent
        self.focusTime = focusTime
    }
}
