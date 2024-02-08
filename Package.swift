// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MealzUIModuleIOS",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v12),
      ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MealzUIModuleIOS",
            targets: ["MealzUIModuleIOS"]),
    ],
    dependencies: [
        // .package(path: "../miam-sdk"),
       .package(url: "https://gitlab.com/miam/kmm-miam-sdk.git", from: "4.0.0-beta3"),
        ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MealzUIModuleIOS",
            dependencies: [
                    .product(name: "MiamIOSFramework", package: "kmm-miam-sdk")
                  ],
            resources: [
                .process("Resources"),
            ]),
    ]
)
