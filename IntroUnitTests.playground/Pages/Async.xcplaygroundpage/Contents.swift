import Foundation
import XCTest

class MotorcycleCourier {

    func getOrder(result: @escaping (Bool) -> Void) {
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { timer in
            result(true)
            timer.invalidate()
        }
    }

}

enum FailureError: Error, CustomStringConvertible {

    case optional(Any)

    internal var description: String {
        switch self {
        case .optional(let object):
            return "expected non-nil value of type \"\(object.self)\""
        }
    }

}

extension XCTestCase {

    public func XCTUnwrap<T>(_ expression: T?, file: StaticString = #filePath, line: UInt = #line) throws -> T {
        if let value = expression {
            return value
        }
        throw FailureError.optional(T.self)
    }

}

class MotorcycleCourierTestCase: XCTestCase {

    var sut: MotorcycleCourier!

    override func setUp() {
        super.setUp()
        sut = MotorcycleCourier()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
//
//    func testSuccess() {
//
//            let expectation = XCTestExpectation(description: #function)
//
//            var data: Data?
//
//            sut.execute { result in
//
//                if case .success(let dataResponse) = result {
//
//                    data = dataResponse
//
//                    expectation.fulfill()
//                }
//            }
//            wait(for: [expectation], timeout: 1)
//
//            XCTAssertNotNil(data)
//
//        }

    func testGetOrder() throws {
        let expectation = XCTestExpectation(description: #function)
        var result: Bool?
        
        sut.getOrder { isResult in
            result = isResult
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.5)
        
       // XCTAssertTrue(try XCTUnwrap(result))
    }

}

MotorcycleCourierTestCase.defaultTestSuite.run()
