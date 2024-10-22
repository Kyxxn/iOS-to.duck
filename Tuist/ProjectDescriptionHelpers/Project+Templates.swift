import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    public static let bundleID = "to.duck.toduck"
    public static let iosVersion = "16.0"
}

extension Project {
    public static func project(
        name: String,
        targets: [Target] = [],
        additionalFiles: [FileElement] = []
    ) -> Project {
        Project(
            name: name,
            targets: targets,
            additionalFiles: additionalFiles
        )
    }
}
