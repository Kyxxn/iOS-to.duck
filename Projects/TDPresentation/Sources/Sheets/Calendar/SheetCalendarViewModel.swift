//
//  SheetCalendarViewModel.swift
//  toduck
//
//  Created by 박효준 on 9/1/24.
//
//
// 날짜 계산로직, 뷰모델로 뽑아봤는데 실패했습니다
// 일단 뷰컨에 다 넣어뒀고, 나중에 쓸 거 같아서 코드 삭제는 안 할게요
//import Foundation
//final class SheetCalendarViewModel {
//    private var firstDate: Date?
//    private var lastDate: Date?
//    private var datesRange: [Date] = []
//
//    // 클로저를 통한 상태 변경 알림
//    var onDatesChanged: (() -> Void)?
//
//    var selectedDates: [Date] {
//        return datesRange
//    }
//
//    func selectDate(_ date: Date) {
//        if firstDate == nil {
//            // Case 1: 아무 날짜도 선택되지 않은 경우
//            firstDate = date
//            datesRange = [firstDate!]
//        } else if firstDate != nil && lastDate == nil {
//            if date < firstDate! {
//                // Case 2-1: firstDate보다 이전 날짜 클릭 시, 단일 선택 날짜를 바꿔줌
//                firstDate = date
//                datesRange = [firstDate!]
//            } else {
//                // Case 2-2: 종료일이 선택된 경우
//                var range: [Date] = []
//                var currentDate = firstDate!
//                
//                while currentDate <= date {
//                    range.append(currentDate)
//                    currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
//                }
//
//                lastDate = range.last
//                datesRange = range
//            }
//        } else if firstDate != nil && lastDate != nil {
//            // Case 3: 시작일-종료일 선택된 상태에서 다른 날짜를 클릭하면, 해당 날짜를 firstDate로
//            firstDate = date
//            lastDate = nil
//            datesRange = [firstDate!]
//        }
//
//        // 상태 변경 알림
//        onDatesChanged?()
//    }
//
//    func deselectDate(_ date: Date) {
//        // 선택 해제 로직
//        datesRange.removeAll()
//        firstDate = nil
//        lastDate = nil
//
//        // 상태 변경 알림
//        onDatesChanged?()
//    }
//
//    func typeOfDate(_ date: Date) -> SelectedDateType {
//        if !datesRange.contains(date) {
//            return .notSelected
//        }
//        if datesRange.count == 1 && date == firstDate {
//            return .singleDate
//        }
//        if date == firstDate {
//            return .firstDate
//        }
//        if date == lastDate {
//            return .lastDate
//        }
//        return .middleDate
//    }
//}
