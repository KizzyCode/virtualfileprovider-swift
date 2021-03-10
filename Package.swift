// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "VirtualFileProvider",
    products: [
        .library(
            name: "VirtualFileProvider",
            targets: ["VirtualFileProvider"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "VirtualFileProvider",
            dependencies: []),
        .testTarget(
            name: "VirtualFileProviderTests",
            dependencies: ["VirtualFileProvider"]),
    ]
)
