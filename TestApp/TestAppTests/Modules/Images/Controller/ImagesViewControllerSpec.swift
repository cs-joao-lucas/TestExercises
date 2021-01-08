//
//  ImagesViewControllerSpec.swift
//  TestAppTests
//
//  Created by joao.lucas.f.pereira on 07/01/21.
//

import XCTest
@testable import TestApp

class ImagesViewControllerSpec: XCTestCase {
    
    var sut: ImagesViewController!
    var apiClient: APIClientStub!

    override func setUp() {
        super.setUp()
        apiClient = APIClientStub()
        sut = ImagesViewController(client: apiClient)
    }
    
    override func tearDown() {
        super.tearDown()
        apiClient = nil
        sut = nil
    }
    
    func testVerifyLoadImagesSuccess() throws {
        let photo = [Photo(urls: ImageURL(small: "www.google.com"))]
        
        let data = try JSONEncoder().encode(photo)
        apiClient.response = data
        
        sut.beginAppearanceTransition(true, animated: false)
        sut.endAppearanceTransition()
        
        XCTAssertEqual(sut.images.count, 1)
    }
    
    func testLifecycle() {
        sut.beginAppearanceTransition(true, animated: false)
        sut.endAppearanceTransition()
        
        XCTAssertNotNil(sut.theView.tableView.dataSource)
        XCTAssertNotNil(sut.theView.tableView.delegate)
    }
    
    //MARK: Test tableview
    func testNumberRowsInSection() {
        sut.beginAppearanceTransition(true, animated: false)
        sut.endAppearanceTransition()
        
        let result = sut.tableView(sut.theView.tableView, numberOfRowsInSection: 0)
        
        XCTAssertEqual(result, sut.images.count)
    }
    
    func testCellForRowAt() {
        sut.beginAppearanceTransition(true, animated: false)
        sut.endAppearanceTransition()
        
        sut.images = [Photo(urls: ImageURL(small: "www.google.com"))]
        
        let index = IndexPath(row: 0, section: 0)
        
        let result = sut.tableView(sut.theView.tableView, cellForRowAt: index)
        
        XCTAssertTrue(result is ImagesViewTableViewCell)
    }

    func testHeightForRowAt() {
        sut.beginAppearanceTransition(true, animated: false)
        sut.endAppearanceTransition()
        
        let index = IndexPath(row: 0, section: 0)
        
        let result = sut.tableView(sut.theView.tableView, heightForRowAt: index)
        
        XCTAssertEqual(result, 300)
    }
    
//    func testDidSelectRowAt() {
//        let viewControllerSpy = ImageNavigationControllerSpy(rootViewController: sut)
//
//        sut.beginAppearanceTransition(true, animated: false)
//        sut.endAppearanceTransition()
//
//        sut.images = [Photo(urls: ImageURL(small: "www.google.com"))]
//
//        let index = IndexPath(row: 0, section: 0)
//
//        sut.tableView(sut.theView.tableView, didSelectRowAt: index)
//
//        XCTAssertTrue(viewControllerSpy.isPushViewControllerCalled)
//        XCTAssertTrue(viewControllerSpy.pushViewController is ImageViewController)
//    }
}
