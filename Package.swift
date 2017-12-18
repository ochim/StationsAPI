// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NearStations",
    dependencies: [
        .package(url: "https://github.com/noppoMan/HexavilleFramework.git", from: "0.1.0"),
        .package(url: "https://github.com/stephencelis/SQLite.swift.git", from: "0.11.4")
    ],
    targets: [
        .target(name: "NearStations", dependencies: ["HexavilleFramework"]),
    ]
)
