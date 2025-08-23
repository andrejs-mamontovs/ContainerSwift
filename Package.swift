// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "ContainerSwift",
    // platforms: [
    //     //.macOS(.v13), .iOS(.v16)
    // ],
    products: [
        .library(name: "ContainerSwift", targets: ["ContainerSwift"])
    ],
    targets: [
        .target(name: "ContainerSwift"),
        .testTarget(name: "ContainerSwiftTests", dependencies: ["ContainerSwift"])
    ]
)
