//
//  Project.swift
//  Packages
//
//  Created by 박효준 on 10/19/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.project(
    name: TDModule.TDNetwork.rawValue,
    targets: [
        Target.target(
            name: TDModule.TDNetwork.rawValue,
            product: .framework,
            bundleId: Project.bundleID + ".network",
            sources: .sources,
            dependencies: [
                .external(name: "Moya")
            ]
        ),
        Target.target(
            name: "\(TDModule.TDNetwork.rawValue)Test",
            product: .unitTests,
            bundleId: Project.bundleID + ".networktest",
            sources: .tests,
            dependencies: [
                .external(name: "Moya")
            ]
        )
    ]
)
