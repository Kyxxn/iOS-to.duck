import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: TDModule.TDCore.rawValue,
    targets: [
        Target.target(
            name: TDModule.TDCore.rawValue,
            product: .framework,
            bundleId: Project.bundleID + ".core",
            sources: .sources,
            dependencies: [
                .external(name: "Swinject")
            ]
        ),
        Target.target(
            name: "\(TDModule.TDCore.rawValue)Test",
            product: .unitTests,
            sources: .tests,
            dependencies: [
                .external(name: "Swinject")
            ]
        )
    ]
)
