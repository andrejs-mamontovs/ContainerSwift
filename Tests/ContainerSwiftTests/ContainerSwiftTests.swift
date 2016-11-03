import XCTest
@testable import ContainerSwift

class ContainerSwiftTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(ContainerSwift().text, "Hello, World!")
    }


    static var allTests : [(String, (ContainerSwiftTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
