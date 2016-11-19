import XCTest
@testable import ContainerSwift

class ContainerSwiftTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let container = ContainerSwift();
        container.register(A.self) {_ in A(name: "Simple Test")}

        let a = container.resolve(A.self)
        XCTAssertEqual(a.name, "Simple Test")
    }

    public class A {

        public var name: String = ""

        public init(name: String) {
            self.name = name
        }
        
    }

    static var allTests : [(String, (ContainerSwiftTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
