// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "View",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "View",
            targets: [
                "View"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/pendo-io/pendo-mobile-ios", branch: "2.20.0.6599-swiftui"),
    ],
    targets: [
        .target(
            name: "View",
            dependencies: [
                .product(name: "Pendo", package: "pendo-mobile-ios")
            ],
            path: "View"
        )
    ]
)
