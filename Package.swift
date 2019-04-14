// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "hpsi-swift",
    products: [
        .library(name: "hpsi-swift", targets: ["App"]),
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
        // 🔥 Alamofire is an HTTP networking library written in Swift.
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "4.8.2"),
        // 🔵 Swift ORM (queries, models, relations, etc) built on SQLite 3.
        .package(url: "https://github.com/vapor/fluent-sqlite.git", from: "3.0.0")
    ],
    targets: [
        .target(name: "App", dependencies: ["FluentSQLite", "Vapor", "Alamofire"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)

