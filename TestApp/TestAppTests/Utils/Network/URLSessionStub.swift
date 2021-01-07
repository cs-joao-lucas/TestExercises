//
//  URLSessionStub.swift
//  TestAppTests
//
//  Created by joao.lucas.f.pereira on 07/01/21.
//

import Foundation
@testable import TestApp

class URLSessionStup: URLSession {
    
    override init() {
        
    }

    var shouldError = false
    var dataResponse = Data()
    var statusCode = 200
    var error = NSError(domain: String(), code: 404, userInfo: nil)
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        if !shouldError {
            let urlResponse = HTTPURLResponse(url: url, statusCode: statusCode, httpVersion: nil, headerFields: nil)
            completionHandler(dataResponse, urlResponse, nil)
            return URLSessionDataTaskFake()
        }
        
        completionHandler(nil, nil, error)
        return URLSessionDataTaskFake()
    }
}

class URLSessionDataTaskFake: URLSessionDataTask {
    
    override init() {
        
    }
    
    override func resume() {
        
    }
    
}
