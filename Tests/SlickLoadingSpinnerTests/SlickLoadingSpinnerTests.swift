import XCTest
@testable import SlickLoadingSpinner

final class SlickLoadingSpinnerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertNotNil(SlickLoadingSpinner(connectionState: .constant(.notStarted)))
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
