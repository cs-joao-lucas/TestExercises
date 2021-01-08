//
//  TestAppUITests.swift
//  TestAppUITests
//
//  Created by joao.lucas.f.pereira on 08/01/21.
//

import XCTest

class FormatterRobot {
    
    var app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    @discardableResult
    func clickTabBar() -> Self {
        app.tabBars.buttons["More"].tap()
        return self
    }
    
    @discardableResult
    func digitTextField(_ text: String) -> Self {
        let textField = app.textFields.firstMatch
        textField.tap()
        textField.typeText(text)
        return self
    }
    
    @discardableResult
    func clickButtonFormatter() -> Self {
        app.buttons["Formatar"].tap()
        return self
    }
    
    func validateFormat(_ textFormatter: String, file: StaticString = #filePath, line: UInt = #line) throws {
        let textField = app.textFields.firstMatch
        let textFildValue = try XCTUnwrap(textField.value as? String, file: file, line: line)
        XCTAssertEqual(textFildValue, textFormatter, file: file, line: line)
    }
}

class TestAppUITests: XCTestCase {
    
    var app: XCUIApplication!
    var robot: FormatterRobot!
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch()
        
        robot = FormatterRobot(app: app)
    }
    
    override func tearDown() {
        super.tearDown()
        app = nil
        robot = nil
    }

//    func testFormatter() throws {
//        app.tabBars.buttons["More"].tap()
//
//        let textField = app.textFields.firstMatch
//        textField.tap()
//        textField.typeText("997237065")
//
//        app.buttons["Formatar"].tap()
//
//        let textFieldValue = try XCTUnwrap(textField.value as? String)
//        XCTAssertEqual(textFieldValue, "99723-7065")
//    }
    
    func testFormatter() throws {
        robot.clickTabBar().digitTextField("997237065").clickButtonFormatter()
        try robot.validateFormat("99723-7065")
    }
}
