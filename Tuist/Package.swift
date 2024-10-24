//
//  Package.swift
//  Config
//
//  Created by 박효준 on 10/19/24.
//

// swift-tools-version: 6.0
@preconcurrency import PackageDescription

#if TUIST
import ProjectDescription

let packageSettings = PackageSettings(
    productTypes: [
        "SnapKit": .framework,
        "Kingfisher": .framework,
        "Moya": .framework,
        "Then": .framework,
        "FSCalendar": .framework,
        "FittedSheets": .framework,
        "Swinject": .framework
    ]
)
#endif

let package = Package(
    name: "toduck",
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit", from: "5.7.1"),
        .package(url: "https://github.com/onevcat/Kingfisher", from: "7.11.0"),
        .package(url: "https://github.com/Moya/Moya", from: "15.0.3"),
        .package(url: "https://github.com/devxoul/Then", from: "3.0.0"),
        .package(url: "https://github.com/WenchaoD/FSCalendar", from: "2.8.4"),
        .package(url: "https://github.com/gordontucker/FittedSheets.git", from: "2.6.1"),
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.9.1")
    ]
)
