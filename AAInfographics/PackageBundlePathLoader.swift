import Foundation

class BundlePathLoader {
	func path(forResource name: String, ofType fileType: String, inDirectory subpath: String? = nil, forLocalization localizationName: String? = nil) -> String? {
		return Bundle.module.path(forResource: name, ofType: fileType, inDirectory: subpath, forLocalization: localizationName)
	}
}
