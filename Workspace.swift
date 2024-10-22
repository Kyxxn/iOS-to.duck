import ProjectDescription
import ProjectDescriptionHelpers

let workspace = Workspace(
    name: "toduck",
    projects: TDModule.allCases.map {
        .relativeToRoot("Projects/\($0.rawValue)")
    }
)
