//
//  TargetDependency+.swift
//  ProjectDescriptionHelpers
//
//  Created by 박천송 on 2023/04/25.
//

import ProjectDescription

public enum External: String {
    case Moya
    case Then
    case FSCalendar
    case Kingfisher
    case SnapKit
    case FittedSheets
}

extension TargetDependency {
    public static func external(dependency: External)-> TargetDependency {
        .external(name: dependency.rawValue, condition: .when([.ios]))
    }
}
