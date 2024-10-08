// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ChaiUtil",
    platforms: [
        .macOS(.v14), .iOS(.v13), .watchOS(.v6), .tvOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ChaiUtil",
            targets: ["ChaiUtil"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ChaiUtil"),
        .testTarget(
            name: "ChaiUtilTests",
            dependencies: ["ChaiUtil"]),
    ]
)
