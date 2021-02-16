// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GamePackage",
    platforms: [.iOS(.v12),.macOS(.v10_12)],
    products: [ 
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "GamePackage",
            targets: ["GamePackage"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "5.0.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.2.0")),
        .package(name: "Realm", url: "https://github.com/realm/realm-cocoa.git", from: "5.4.4"),
//        .package(name: "coreCobaTestPodspec", url: "https://github.com/billmachine/coreCobaTestPodspec.git", from: "1.0.2"),
        .package(url: "https://github.com/billmachine/CategoryPackage.git", .upToNextMajor(from: "1.0.0")),
        
//        .package(path: "../C"),
//        .package(path: "../CategoryPackage"),
//        .package(path: "../CoreOfflineAppTestKit")
        
        .package(url: "https://github.com/billmachine/CoreOfflineAppTestKit.git", from: "1.0.0"),
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "GamePackage",
            dependencies: [
                .product(name: "RealmSwift", package: "Realm"),
                            "RxSwift",
                            "Alamofire",
                            "CategoryPackage",
                            "CoreOfflineAppTestKit"
//                            "coreCobaTestPodspec"
            ]),
        .testTarget(
            name: "GamePackageTests",
            dependencies: ["GamePackage"]),
    ]
)
