import XCTest
@testable import AAInfographics

#if DEBUG
@available(iOS 10.0, macCatalyst 13.1, macOS 10.13, *)
final class AAChartViewDebugLoggingTests: XCTestCase {
    func testDebugLoggingTruncatesOnlyTheSerializedCopy() throws {
        let longData: [Any] = Array(0...1_000)
        let series = (0..<11).map { index -> AASeriesElement in
            let data: [Any] = index == 0 ? longData : [index as Any]
            return AASeriesElement()
                .name("Synthetic series \(index)")
                .data(data)
        }
        let options = AAOptions().series(series)

        let loggedOptions = AAChartView.optionsDictionaryForDebugLogging(options)
        let loggedSeries = try XCTUnwrap(loggedOptions["series"] as? [[String: Any]])
        let loggedData = try XCTUnwrap(loggedSeries[0]["data"] as? [Any])

        XCTAssertEqual(loggedSeries.count, 10)
        XCTAssertEqual(loggedData.count, 1_000)
        XCTAssertEqual(options.series?.count, 11)
        XCTAssertEqual(series[0].data?.count, longData.count)
        XCTAssertTrue(series.dropFirst().allSatisfy { ($0.data?.count ?? 0) == 1 })
    }
}
#endif
