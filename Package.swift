// swift-tools-version: 6.0.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "libcmark_extend",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "libcmark_extend",
            targets: ["libcmark_extend"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "libcmark_extend"),
        .testTarget(
            name: "libcmark_extendTests",
            dependencies: ["libcmark_extend"]
        ),
    ]
)
