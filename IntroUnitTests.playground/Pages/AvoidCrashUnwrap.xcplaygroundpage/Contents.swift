import Foundation
import XCTest

class RemindKeeper {

    var reminders: [Reminder]

    init() {
        reminders = [Reminder()]
    }

}

class Reminder {

    var time = 5

    func shouldTakePill() -> Bool {
        return time == 6
    }

}

class ReminderTestCase: XCTestCase {

    var sut: RemindKeeper!

    override func setUp() {
        super.setUp
        sut = RemindKeeper()
    }

    override func tearDown() {
        sut = nil
        super.tearDown
    }

    func testNotTime() throws {
        let remind = try XCTUnwrap(sut.reminders.first)
        remind.time = 15

        XCTAssertFalse(remind.shouldTakePill())
    }

    func testIsTime() {
        guard let remind = sut.reminders.first else {
            return XCTFail("Expected one number")
        }
    
        remind.time = 6

        XCTAssertTrue(remind.shouldTakePill())
    }

}

ReminderTestCase.defaultTestSuite.run()
