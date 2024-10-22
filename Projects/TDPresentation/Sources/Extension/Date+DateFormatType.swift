import Foundation
import Then

enum DateFormatType {
    case yearMonth
    case time12Hour
    case time12HourEnglish
    case time24Hour
    
    var formatter: DateFormatter {
        switch self {
        case .yearMonth:
            return DateFormatter().then {
                $0.dateFormat = "yyyy년 MM월"
            }
        case .time12Hour:
            return DateFormatter().then {
                $0.dateFormat = "a h시 m분"
                $0.amSymbol = "오전"
                $0.pmSymbol = "오후"
            }
        case .time12HourEnglish:
            return DateFormatter().then {
                $0.dateFormat = "a h:mm"
                $0.amSymbol = "AM"
                $0.pmSymbol = "PM"
            }
        case .time24Hour:
            return DateFormatter().then {
                $0.dateFormat = "HH:mm"
            }
        }
    }
}

// MARK: - Date <-> String 타입변환 Extension
extension Date{
    
    /// String을 Format을 지정하여 Date?으로 변환합니다.
    ///
    /// - Date.convertToDate(format: .yearMonth)
    /// - Parameters:
    ///   - format: DateFormatType으로 직접 format을 지정할 수 있음
    /// - Returns: Date? 타입으로 반환
    static func convertFromString(_ date: String, format: DateFormatType) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.formatter.dateFormat
        return dateFormatter.date(from: date)
    }
    
    /// Date을 Format을 지정하여 String 타입으로 변환합니다.
    /// - Parameters:
    ///   - formatType: DateFormatType으로 직접 format을 지정할 수 있음
    /// - Returns: Format에 맞는 String형 반환
    func convertToString(formatType: DateFormatType = .yearMonth) -> String {
        return formatType.formatter.string(from: self)
    }
    
}

// MARK: - Format으로 표현할 수 없는 경우의 Date Extension
extension Date {
    /// pram의 Date와 현재 시간을 비교하는 상대시간을 String으로 반환하는 함수
    /// - Returns: 1시간전, 1일전, 1주전, 1개월전, 1년전과 같은 상대시간을 반환
    func convertRelativeTime() -> String {
        let now = Date()
        let diff = Int(now.timeIntervalSince(self))
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        let month = 30 * day
        let year = 365 * day
        
        if diff < minute {
            return diff < 5 ? "방금 전" : "\(diff)초 전"
        } else if diff < hour {
            return "\(diff / minute)분 전"
        } else if diff < day {
            return "\(diff / hour)시간 전"
        } else if diff < week {
            return "\(diff / day)일 전"
        } else if diff < month {
            return "\(diff / week)주 전"
        } else if diff < year {
            return "\(diff / month)개월 전"
        } else {
            return "\(diff / year)년 전"
        }
    }
}
