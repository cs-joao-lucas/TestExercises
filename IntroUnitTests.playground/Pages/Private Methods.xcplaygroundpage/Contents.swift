import Foundation
import XCTest

enum MusicType {
    case rock
    case pop
}

enum Music {
    case none
    case name(String)
}

class JukeBox {

    var currentMusic: Music = .none

    func playMusic(type: MusicType) {
        switch type {
        case .rock:
            playRock()
        case .pop:
            playPop()
        }
    }

    private func playRock() {
        currentMusic = .name("Black in Black")
    }

    private func playPop() {
        currentMusic = .name("Toxic")
    }
}

class MusicTestCase: XCTestCase {
    
    var sut: JukeBox!

    override func setUp() {
        super.setUp()
        // Arrange
        sut = JukeBox()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testVerifyPlayRock() {
        sut.playMusic(type: .rock)
        
        let music = sut.currentMusic
        
        guard case .name(let musicName) = music else {
            return XCTFail("Expect name got none")
        }
        
        XCTAssertEqual(musicName, "Black in Black")
    }
    
    func testVerifyPlayPop() {
        sut.playMusic(type: .pop)
        
        let music = sut.currentMusic
        
        guard case .name(let musicName) = music else {
            return XCTFail("Expect name got none")
        }
        
        XCTAssertEqual(musicName, "Toxic")
    }
}

MusicTestCase.defaultTestSuite.run()
