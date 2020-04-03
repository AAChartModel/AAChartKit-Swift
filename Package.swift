// swift-tools-version:5.0
import PackageDescription

let package = Package(
     name: "AAInfographics",
     platforms: [
         .iOS(.v9)
     ],
     products: [
         .library(name: "AAInfographics", targets: ["AAInfographics"])
     ],
     targets: [
        .target(
               name: "AAInfographics",
               path: "AAInfographics"
        )
     ]
 )
