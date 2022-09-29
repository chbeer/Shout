// swift-tools-version:5.0
// Managed by ice

import PackageDescription

let package = Package(
    name: "Shout",
    platforms: [
        .macOS(.v10_10)
    ],
    products: [
        .library(name: "Shout", targets: ["Shout"]),
    ],
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/BlueSocket", from: "1.0.46"),
        .package(url: "https://github.com/DimaRU/Libssh2Prebuild.git", .branch("1.10.0+OpenSSL_1_1_1o"))
    ],
    targets: [
        .target(name: "Shout", dependencies: [
            .product(name: "CSSH", package: "Libssh2Prebuild"),
            "Socket"
        ]),
        .testTarget(name: "ShoutTests", dependencies: ["Shout"]),
    ]
)
