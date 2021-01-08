//
//  ImageViewSpec.swift
//  TestAppTests
//
//  Created by joao.lucas.f.pereira on 08/01/21.
//

//import XCTest
//import FBSnapshotTestCase
//@testable import TestApp
//
//class ImageViewSpec: FBSnapshotTestCase {
//
//    var sut: ImageView!
//
//    override func setUpWithError() throws {
//        try super.setUpWithError()
//        let image = try XCTUnwrap(UIImage(named: "paisagem.jpg", in: Bundle(for: ImageViewSpec.self), compatibleWith: nil))
//        sut = ImageView(frame: UIScreen.main.bounds, image: image)
//    }
//
//    override func tearDown() {
//        super.tearDown()
//        sut = nil
//    }
//
//    func testVerifySnapshot() {
//        recordMode = false
//        FBSnapshotVerifyView(sut)
//    }
//}
