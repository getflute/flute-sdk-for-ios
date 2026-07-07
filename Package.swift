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
            url: "https://github.com/getflute/flute-sdk-for-ios/releases/download/v1.0.0-pre-release-3/Flute.xcframework.zip",
            checksum: "84d9e1856787e2085f1e5ae3d29ae9cd6f8b731ac51c9b28433ced3ffe9b7244"
        ),
        .binaryTarget(
            name: "CloudCommerce",
            url: "https://github.com/getflute/flute-sdk-for-ios/releases/download/v1.0.0-pre-release-3/CloudCommerce.xcframework.zip",
            checksum: "972e794df12e52ff2a239b0941c7058927dd90b897e4e3ed711154284ccaa7a2"
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
