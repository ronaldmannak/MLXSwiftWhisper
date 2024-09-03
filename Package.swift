// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MLXSwiftWhisper",
    platforms: [.macOS(.v14), .iOS(.v16)],
    products: [
        .library(
            name: "MLXSwiftWhisper",
            targets: ["MLXSwiftWhisper"]
        ),
        .executable(
            name: "MLXSwiftWhisper-cli",
            targets: ["MLXSwiftWhisperCLI"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/ml-explore/mlx-swift.git", from: "0.16.1"),
        .package(url: "https://github.com/huggingface/swift-transformers.git", from: "0.1.9"),
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.5.0"),
    ],
    targets: [
        .target(
            name: "MLXSwiftWhisper",
            dependencies: [
                .product(name: "MLX", package: "mlx-swift"),
                .product(name: "MLXFast", package: "mlx-swift"),
                .product(name: "MLXNN", package: "mlx-swift"),
                .product(name: "MLXOptimizers", package: "mlx-swift"),
                .product(name: "MLXRandom", package: "mlx-swift"),
                .product(name: "Transformers", package: "swift-transformers"),
            ]
        ),
        .executableTarget(
            name: "MLXSwiftWhisperCLI",
            dependencies: [
                "MLXSwiftWhisper",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .testTarget(
            name: "MLXSwiftWhisperTests",
            dependencies: ["MLXSwiftWhisper"]
        ),
    ]
)
