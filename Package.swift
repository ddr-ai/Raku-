// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "LocalAI",
    platforms: [
        .iOS(.v17)
    ],
    products: [],
    dependencies: [
        .package(url: "https://github.com/eastriverlee/LLM.swift", from: "1.0.0")
    ],
    targets: []
)