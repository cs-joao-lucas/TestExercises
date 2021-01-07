//
//  APIClientDefaultSpec.swift
//  TestAppTests
//
//  Created by joao.lucas.f.pereira on 07/01/21.
//

import XCTest
@testable import TestApp

class APIClientDefaultSpec: XCTestCase {
    
    var stub: URLSessionStup!
    var sut: APIClientDefault!

    override func setUp() {
        super.setUp()
        stub = URLSessionStup()
        sut = APIClientDefault(session: stub)
    }
    
    override func tearDown() {
        super.tearDown()
        stub = nil
        sut = nil
    }

    func testVerifyURLSessionSuccess() {
        let expection = XCTestExpectation(description: #function)
        
        guard let url = URL(string: "www.google.com.br") else {
            return XCTFail()
        }
        
        var data: Data?
        sut.request(url) { result in
            if case .success(let dataRequest) = result {
                data = dataRequest
                expection.fulfill()
            }
        }
        
        wait(for: [expection], timeout: 1)
        XCTAssertNotNil(data)
    }
    
    func testVerifyErrorURLSession404() {
        let expection = XCTestExpectation(description: #function)
        
        guard let url = URL(string: "www.google.com.br") else {
            return XCTFail()
        }
        
        stub.statusCode = 404
        
        var networkError: NetworkError?
        sut.request(url) { result in
            if case .failure(let network) = result {
                networkError = network
                expection.fulfill()
            }
        }
        
        wait(for: [expection], timeout: 1)
        XCTAssertEqual(networkError, .requestFailed)
    }
    
    func testVerifyError() {
        stub.shouldError = true
        
        let expection = XCTestExpectation(description: #function)
        
        guard let url = URL(string: "www.google.com.br") else {
            return XCTFail()
        }
        
        var networkError: NetworkError?
        sut.request(url) { result in
            if case .failure(let network) = result {
                networkError = network
                expection.fulfill()
            }
        }
        
        wait(for: [expection], timeout: 1)
        XCTAssertEqual(networkError, .requestFailed)
    }
}
