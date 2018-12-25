// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-typescript",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "SwiftTypescript",
            targets: ["SwiftTypescript"]),
        .library(
            name: "SwiftElement",
            targets: ["SwiftElement"]),
        .library(
            name: "SwiftDOM",
            targets: ["SwiftDOM"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SwiftTypescript",
            dependencies: [
                "SwiftDOM",
                "SwiftElement"
            ]),
        .testTarget(
            name: "SwiftTypescriptTests",
            dependencies: [
                "SwiftTypescript", 
                "SwiftElement",
                "SwiftDOM"
            ]),
        .target(
            name: "SwiftElement",
            dependencies: []),
        .testTarget(
            name: "SwiftElementTests",
            dependencies: ["SwiftElement", "SwiftDOM"]),
        .target(
            name: "SwiftDOM",
            dependencies: ["SwiftElement"]),
        .testTarget(
            name: "SwiftDOMTests",
            dependencies: ["SwiftDOM"]),
    ]
)
