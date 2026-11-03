// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "LocalAI",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(name: "LocalAI", targets: ["LocalAI"])
    ],
    dependencies: [
        .package(url: "https://github.com/eastriverlee/LLM.swift", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "LocalAI",
            dependencies: [
                .product(name: "LLM", package: "LLM.swift")
            ],
            path: "LocalAI/LocalAI",
            sources: ["App.swift", "ChatView.swift"],
            resources: [
                .process("Resources")
            ]
        )
    ]
)