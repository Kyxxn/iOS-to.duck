import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.project(
    name: TDModule.TDDesign.rawValue,
    targets: [
        Target.target(
            name: TDModule.TDDesign.rawValue,
            product: .framework,
            bundleId: Project.bundleID + ".design",
            sources: .sources,
            resources: .default,
            dependencies: [
                .external(name: "FSCalendar"),
                .external(name: "SnapKit"),
                .external(name: "Then"),
            ]
        )
    ]
)
