//
//  PackageBundlePathLoader.swift
//  AAInfographicsDemo
//
//  Created by An An on 2022/5/24.
//  Copyright © 2022 An An. All rights reserved.
//

import Foundation

class BundlePathLoader {
    func path(
        forResource name: String,
        ofType fileType: String,
        inDirectory subpath: String? = nil,
        forLocalization localizationName: String? = nil
    ) -> String? {
        return Bundle.module.path(
            forResource: name,
            ofType: fileType,
            inDirectory: subpath,
            forLocalization: localizationName
        )
    }
}
