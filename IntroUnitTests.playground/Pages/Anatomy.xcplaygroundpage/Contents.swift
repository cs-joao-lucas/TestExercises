import XCTest
import Foundation

class Validator {

    func isValid(text: String) -> Bool {
        return text.count > 10
    }

    func isValid(number: Int) -> Bool {
        return number > 0 && number % 2 == 0
    }

}

class ValidatorTestCase: XCTestCase {

    var sut: Validator!

    override func setUp() {
        super.setUp()
        // Arrange
        sut = Validator()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testValidText() {
        // Act
        let text = String(repeating: "a", count: 11)
        let result = sut.isValid(text: text)
        
        // Assert
        XCTAssertTrue(result)
    }
    
    func testValidNumber() {
        let number = 4
        let result = sut.isValid(number: number)
        
        XCTAssertTrue(result)
    }
    
    func testInvalidText() {
        let text = String(repeating: "", count: 10)
        let result = sut.isValid(text: text)
        
        XCTAssertFalse(result)
    }

    func testInvalidNumber() {
        let number = 9
        let result = sut.isValid(number: number)
        
        XCTAssertFalse(result)
    }
}

ValidatorTestCase.defaultTestSuite.run()
