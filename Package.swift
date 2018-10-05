// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CodableXPC",
    products: [
        .library(
            name: "CodableXPC",
            targets: ["CodableXPC"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "CodableXPC",
            dependencies: []),
        .testTarget(
            name: "CodableXPCTests",
            dependencies: ["CodableXPC"]),
    ]
)
