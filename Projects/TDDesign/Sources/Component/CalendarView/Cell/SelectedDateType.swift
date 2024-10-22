//
//  SelectedDateType.swift
//  toduck
//
//  Created by 박효준 on 8/25/24.
//

import Foundation

public enum SelectedDateType {
    case singleDate  // 단일 날짜 선택
    case firstDate   // 여러 날짜 선택 시, 시작일
    case middleDate  // 시작-종료를 제외한 중간 날짜
    case lastDate    // 여러 날짜 선택 시, 종료일
    case notSelected // 선택되지 않은 날짜
}
