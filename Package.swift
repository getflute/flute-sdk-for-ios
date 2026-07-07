// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FluteMobileSDK",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "FluteMobileSDK",
            targets: ["FluteMobileSDK"]
        ),
    ],
    dependencies: [
        // Required for Flute.xcframework
        .package(url: "https://github.com/apple/swift-openapi-runtime.git", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-openapi-urlsession.git", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-http-types.git", from: "1.0.0"),
        // Required for CloudCommerce.xcframework
        // Pinned to exact version for supply chain security (third-party crypto library)
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", exact: "1.8.4"),
        .package(url: "https://github.com/apple/swift-asn1.git", from: "1.2.0"),
        .package(url: "https://github.com/apple/swift-certificates.git", from: "1.0.0"),
    ],
    targets: [
        .binaryTarget(
            name: "Flute",
            url: "https://github.com/getflute/flute-sdk-for-ios/releases/download/v1.0.0/Flute.xcframework.zip",
            checksum: "10d603e7e95131bc82bcc52d9457272fe8103bf6d24b68f58fa6fa5fa392e4e4"
        ),
        .binaryTarget(
            name: "CloudCommerce",
            url: "https://github.com/getflute/flute-sdk-for-ios/releases/download/v1.0.0/CloudCommerce.xcframework.zip",
            checksum: "9e59f2013544e0307e8e27239bc2d8dcadc5cbd949dcd1bb1422d4eaf3a4e74c"
        ),
        .target(
            name: "FluteMobileSDK",
            dependencies: [
                "Flute",
                "CloudCommerce",
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
                .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession"),
                .product(name: "HTTPTypes", package: "swift-http-types"),
                .product(name: "CryptoSwift", package: "CryptoSwift"),
                .product(name: "SwiftASN1", package: "swift-asn1"),
                .product(name: "X509", package: "swift-certificates"),
            ],
            path: "Sources/FluteMobileSDK"
        ),
    ]
)
