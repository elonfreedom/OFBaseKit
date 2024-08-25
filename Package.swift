// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OFBaseKit",
    platforms: [
       .iOS(.v15) // 指定最低支持的 iOS 版本
      ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "OFBaseKit",
            targets: ["OFBaseKit"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "OFBaseKit",
            path: "Sources",
            resources: [.copy("OFBaseKit/Resources/PrivacyInfo.xcprivacy")]
        ),
        .testTarget(
            name: "OFBaseKitTests",
            dependencies: ["OFBaseKit"]),
    ]
)
