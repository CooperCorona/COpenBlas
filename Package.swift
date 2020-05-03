// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BlasWrapper",
    pkgConfig: "blaswrapper",
    products: [
        .library(name: "BlasWrapper", targets: ["BlasWrapper"])
    ],
    targets: [
        .systemLibrary(
            name: "Openblas",
            pkgConfig: "libopenblas-dev",
            providers: [
                .apt(["libopenblas-dev"]),
                .apt(["liblapack-dev"])
            ]
        )
    ]
)
