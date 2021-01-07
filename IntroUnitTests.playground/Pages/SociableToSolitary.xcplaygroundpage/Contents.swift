import XCTest
import LocalAuthentication

class LaContextStup: LAContext {
    
    var isError = false
    var shouldEvaluatePolicy = true
    var errorCode: LAError.Code = .invalidContext
    
    override func canEvaluatePolicy(_ policy: LAPolicy, error: NSErrorPointer) -> Bool {
        if !shouldEvaluatePolicy {
            error?.pointee = NSError(domain: "self", code: errorCode.rawValue, userInfo: nil)
        }
        
        return shouldEvaluatePolicy
    }
    
    override func evaluatePolicy(_ policy: LAPolicy, localizedReason: String, reply: @escaping (Bool, Error?) -> Void) {
        if isError {
            let error = LAError(errorCode)
            reply(false, error)
            return
        }
        
        reply(shouldEvaluatePolicy, nil)
    }
}

class RequestBiometryTestCase: XCTestCase {

    var sut: RequestBiometry!
    var laContextStub: LaContextStup!

    override func setUp() {
        super.setUp()
        laContextStub = LaContextStup()
        sut = RequestBiometry(evaluetePolicy: laContextStub)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testRequestSucessed() {
        var sucessed: Bool = false
        let expectation = self.expectation(description: #function)
        sut.request { isGranted in
            if isGranted {
                sucessed = true
                expectation.fulfill()
            }
        }

        waitForExpectations(timeout: 2)
        //XCTAssertTrue(sucessed)
    }

    func testRequestError() {
        laContextStub.shouldEvaluatePolicy = false
        
        var refused: Bool = false
        let expectation = self.expectation(description: #function)
        sut.request { isGranted in
            if !isGranted {
                refused = true
                expectation.fulfill()
            }
        }

        waitForExpectations(timeout: 2)
        //XCTAssertTrue(refused)
    }

}

RequestBiometryTestCase.defaultTestSuite.run()
