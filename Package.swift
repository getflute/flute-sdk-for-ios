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
            url: "https://github.com/getflute/flute-sdk-for-ios/releases/download/v1.0.0-pre-release-2/Flute.xcframework.zip",
            checksum: "c78fab619aad113461a4f9e5f0b406574c9ced49cc47daf4661679e02d7c67e6"
        ),
        .binaryTarget(
            name: "CloudCommerce",
            url: "https://github.com/getflute/flute-sdk-for-ios/releases/download/v1.0.0-pre-release-2/CloudCommerce.xcframework.zip",
            checksum: "e10ba29efdbb591862e28a5d35b9d85896b80843c420b08e51df88052f9ee8c9"
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
