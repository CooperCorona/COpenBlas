// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "COpenBlas",
    products: [
        .library(name: "COpenBlas", targets: ["COpenBlas"])
    ],
    targets: [
        .systemLibrary(
            name: "COpenBlas",
            pkgConfig: "libopenblas-dev",
            providers: [
                .apt(["libopenblas-dev"]),
                .apt(["liblapack-dev"])
            ]
        )
    ]
)
