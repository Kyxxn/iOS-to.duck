//
//  TargetDependency+Module.swift
//  ProjectDescriptionHelpers
//
//  Created by 박천송 on 7/15/24.
//

import ProjectDescription

// MARK: Core

extension TargetDependency {
    public static func core()-> TargetDependency {
        .project(target: "TDCore", path: .relativeToRoot("Projects/TDCore"))
    }
}

// MARK: DesignSystem

extension TargetDependency {
    public static func design()-> TargetDependency {
        .project(target: "TDDesign", path: .relativeToRoot("Projects/TDDesign"))
    }
}

// MARK: Network

extension TargetDependency {
    public static func network()-> TargetDependency {
        .project(target: "TDNetwork", path: .relativeToRoot("Projects/TDNetwork"))
    }
}

// MARK: Storage

extension TargetDependency {
    public static func storage()-> TargetDependency {
        .project(target: "TDStorage", path: .relativeToRoot("Projects/TDStorage"))
    }
}

// MARK: Data

extension TargetDependency {
    public static func data()-> TargetDependency {
        .project(target: "TDData", path: .relativeToRoot("Projects/TDData"))
    }
}


// MARK: Domain

extension TargetDependency {
    public static func domain()-> TargetDependency {
        .project(target: "TDDomain", path: .relativeToRoot("Projects/TDDomain"))
    }
}

// MARK: Presentation

extension TargetDependency {
    public static func presentation()-> TargetDependency {
        .project(target: "TDPresentation", path: .relativeToRoot("Projects/TDPresentation"))
    }
}


