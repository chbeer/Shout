// swift-tools-version:5.6
// Managed by ice / chbeer

import PackageDescription

let package = Package(
    name: "Shout",
    platforms: [
        .macOS(.v10_10),
        .iOS(.v12)
    ],
    products: [
        .library(name: "Shout", targets: ["Shout", "libssh2", "libcrypto"]),
//        .library(name: "libssh2", targets: ["libssh2"]),
    ],
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/BlueSocket", from: "1.0.46"),
        .package(url: "https://github.com/DimaRU/Libssh2Prebuild.git", branch: "1.10.0+OpenSSL_1_1_1o")
    ],
    targets: [
        .binaryTarget(
            name: "libssh2",
            path: "Sources/Frameworks/libssh2.xcframework"),
        .binaryTarget(
            name: "libcrypto",
            path: "Sources/Frameworks/libcrypto.xcframework"),
//        .systemLibrary(
//            name: "CSSH"
//        ),
        .target(
            name: "Shout",
            dependencies: [
                .product(name: "CSSH", package: "Libssh2Prebuild"),
//                "libssh2",
//                "libcrypto",
                .product(name: "Socket", package: "BlueSocket")
            ],
            linkerSettings: [
                .linkedLibrary("z")
            ]
        ),
        .testTarget(name: "ShoutTests", dependencies: ["Shout"]),
    ]
)
