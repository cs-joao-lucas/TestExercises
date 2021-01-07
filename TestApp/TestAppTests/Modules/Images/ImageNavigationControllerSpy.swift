//
//  ImageNavigationControllerSpy.swift
//  TestAppTests
//
//  Created by joao.lucas.f.pereira on 07/01/21.
//

import Foundation
import UIKit
@testable import TestApp

class ImageNavigationControllerSpy: UINavigationController {
    
    var pushViewController = UIViewController()
    var isPushViewControllerCalled = false
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        pushViewController = UIViewController()
        isPushViewControllerCalled = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        isPushViewControllerCalled = true
        pushViewController = viewController
    }
    
}
