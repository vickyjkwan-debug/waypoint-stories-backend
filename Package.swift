// swift-tools-version:5.8
import PackageDescription

let package = Package(
    name: "waypoint-stories-backend",
    platforms: [
        .macOS(.v13),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.90.0"),
    ],
    targets: [
        .executableTarget(
            name: "App",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
            ]
        ),
    ]
)
