//
//  ImagesServiceSpec.swift
//  TestAppTests
//
//  Created by joao.lucas.f.pereira on 07/01/21.
//

import XCTest
@testable import TestApp

//func testSuccess() {
//        let expectation = XCTestExpectation(description: #function)
//
//        var data: Data?
//        sut.execute { result in
//
//            if case .success(let dataResponse) = result {
//
//                data = dataResponse
//
//                expectation.fulfill()
//            }
//        }
//        wait(for: [expectation], timeout: 1)

//        XCTAssertNotNil(data)
//    }

class ImagesServiceSpec: XCTestCase {

    var apiClientStub: APIClientStub!
    var sut: ImagesService!
    
    override func setUp() {
        super.setUp()
        apiClientStub = APIClientStub()
        sut = ImagesService(client: apiClientStub)
    }
    
    override func tearDown() {
        apiClientStub = nil
        sut = nil
        super.tearDown()
    }
    
    func testVerifySuccess() throws {
        let photo = [Photo(urls: ImageURL(small: "www.google.com"))]
        let data = try JSONEncoder().encode(photo)
        
        apiClientStub.response = data
        
        let expectation = XCTestExpectation(description: #function)
        
        var dataPhoto: [Photo]?
        sut.fetchImages { imagesResult in
            if case .success(let photo) = imagesResult {
                dataPhoto = photo
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 1)
        
        let firstDataPhoto = try XCTUnwrap(dataPhoto?.first)
        let firstPhoto = try XCTUnwrap(photo.first)
        
        XCTAssertEqual(firstDataPhoto.urls.small, firstPhoto.urls.small)
    }
    
    func testVerifyFailure() {
        let expectation = XCTestExpectation(description: #function)
        
        var apiError: NetworkError?
        sut.fetchImages { imagesResult in
            if case .failure(let error) = imagesResult {
                apiError = error
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 1)
        
        XCTAssertEqual(apiError, .decodeFailure)
    }
    
    func testVerifyErrorApi() {
        apiClientStub.isError = true
        
        let expectation = XCTestExpectation(description: #function)
        
        var apiError: NetworkError?
        sut.fetchImages { imageResult in
            if case .failure(let error) = imageResult {
                apiError = error
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(apiError, .requestFailed)
    }
}
