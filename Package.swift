// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Colors",
    platforms: [
        .iOS(.v9),
        .macOS(.v10_10)
    ],
    products: [
        .library(
            name: "Colors",
            targets: [
                "Colors"
            ]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/auremsinistram/PropertyWrappers.git",
            from: .init(0, 2, 0)
        )
    ],
    targets: [
        .target(
            name: "Colors",
            dependencies: [
                .product(
                    name: "PropertyWrappers"
                )
            ]
        )
    ]
)
