import XCTest

@testable import ContainerSwift

class ContainerSwiftTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let container = ContainerSwift()
        container.register(TestProtocol.self) { _ in TestProtocolImpl(name: "Simple Test") }

        let a = container.resolve(TestProtocol.self)
        XCTAssertEqual(a.name, "Simple Test")
    }

    public struct TestProtocolImpl: TestProtocol {

        public var name: String = ""

        // public init(name: String) {
        //     self.name = name
        // }

    }

    protocol TestProtocol {
        var name: String { get }
    }

    static var allTests: [(String, (ContainerSwiftTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample)
        ]
    }
}
