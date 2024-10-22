//
//  Project.swift
//  Packages
//
//  Created by 박효준 on 10/19/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.project(
    name: TDModule.TDStorage.rawValue,
    targets: [
        Target.target(
            name: TDModule.TDStorage.rawValue,
            product: .framework,
            bundleId: Project.bundleID + ".storage",
            sources: .sources,
            dependencies: [
            ]
        ),
        Target.target(
            name: "\(TDModule.TDStorage.rawValue)Test",
            product: .unitTests,
            bundleId: Project.bundleID + ".storagetest",
            sources: .tests,
            dependencies: [
            ]
        )
    ]
)
