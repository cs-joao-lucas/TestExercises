//
//  APIClientStub.swift
//  TestAppTests
//
//  Created by joao.lucas.f.pereira on 07/01/21.
//
//
//class URLSessionStub: URLSession {
//
//    var shouldError: Bool = false
//
//    var dataResponse: Data = Data()
//
//    var statusCode: Int = 200
//
//    var error: Error = NSError(domain:String(), code:404, userInfo:nil)

//    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//
//        if !shouldError {
//
//            let urlResponse = HTTPURLResponse(url: url, statusCode: statusCode, httpVersion: nil, headerFields: nil)
//
//            completionHandler(dataResponse, urlResponse , nil)
//
//            return URLSessionDataTaskFake()
//
//        }
//
//        completionHandler(nil, nil , error)
//
//        return URLSessionDataTaskFake()
//    }
//}

import Foundation
@testable import TestApp

class APIClientStub: APIClient {
    
    var isError = false
    var response = Data()
    
    func request(_ url: URL, completion: @escaping (APIResult) -> Void) {
        if !isError {
            completion(.success(response))
            return
        }
        
        completion(.failure(.requestFailed))
    }
}
