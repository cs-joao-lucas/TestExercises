import Foundation
import XCTest

struct Coffe {
    var haveMilk: Bool
    var isStrong: Bool
}

class CoffeMaker {

    static func makeLatte() -> Coffe {
        return Coffe(haveMilk: true, isStrong: false)
    }

    static func makeEspresso() -> Coffe {
        return  Coffe(haveMilk: false, isStrong: true)
    }

}

class CoffeMakerTestCase: XCTestCase {
    
    func testMakeLatter() {
        let coffeLatter = CoffeMaker.makeLatte()
        
        XCTAssertTrue(coffeLatter.haveMilk)
        XCTAssertFalse(coffeLatter.isStrong)
    }
    
    func testMakeExpresso() {
        let coffeMakeEspresso = CoffeMaker.makeEspresso()
        
        XCTAssertFalse(coffeMakeEspresso.haveMilk)
        XCTAssertTrue(coffeMakeEspresso.isStrong)
    }
}

CoffeMakerTestCase.defaultTestSuite.run()
