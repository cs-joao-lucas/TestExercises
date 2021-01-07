//
//  URLBuilderSpec.swift
//  TestAppTests
//
//  Created by joao.lucas.f.pereira on 07/01/21.
//

import XCTest
@testable import TestApp

class URLBuilderSpec: XCTestCase {

    func testVerifyBuilderParameters() {
        let path = "/images"
        let parameters = ["paramenterOne": "4"]
        
        let sut = URLBuilder(path: path, parameters: parameters)
        
        let url = sut.createURL()
        
        XCTAssertEqual(url?.absoluteString, "https://api.unsplash.com/images?client_id=cd5cea5b5b8e03ef359b2ca8868c98da05818689615a630d09c70150be9c8b09&paramenterOne=4")
    }
    
    func testVerifyBuilderWithoutParamenters() {
        let path = "/images"
        
        let sut = URLBuilder(path: path)
        let url = sut.createURL()
        
        XCTAssertEqual(url?.absoluteString, "https://api.unsplash.com/images?client_id=cd5cea5b5b8e03ef359b2ca8868c98da05818689615a630d09c70150be9c8b09")
    }
}

