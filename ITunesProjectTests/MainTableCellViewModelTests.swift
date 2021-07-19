//
//  MainTableCellViewModelTests.swift
//  ITunesProjectTests
//
//  Created by Yoonha Kim on 7/19/21.
//

import XCTest
@testable import ITunesProject

class MainTableCellViewModelTests: XCTestCase {
    
    var mainTableCellViewModel: MainTableCellViewModel!
    
    override func setUp() {
        super.setUp()
        mainTableCellViewModel = MainTableCellViewModel(info: getArtistInformation()
        )
    }
    
    override func tearDown() {
        mainTableCellViewModel = nil
        super.tearDown()
    }
    
    func testComputationalProperties() {
        XCTAssertEqual(mainTableCellViewModel.artistName, "testName")
        XCTAssertEqual(mainTableCellViewModel.trackName, "testTrackName")
        XCTAssertEqual(mainTableCellViewModel.trackPrice, "$5.0")
        XCTAssertEqual(mainTableCellViewModel.releaseDate, "2021-07-09")
        XCTAssertEqual(mainTableCellViewModel.primaryGenreName, "Genre: Music")
        XCTAssertEqual(mainTableCellViewModel.imageUrl, "https://is2-ssl.mzstatic.com/image/thumb/Video125/v4/37/d7/b3/37d7b32d-90d2-762b-33bf-1b3cbe5b5690/source/100x100bb.jpg")
    }
    
    private func getArtistInformation() -> ArtistInformation {
        ArtistInformation(artistName: "testName",
                          trackName: "testTrackName",
                          trackPrice: 5.0,
                          releaseDate: "2021-07-09T07:00:00Z",
                          primaryGenreName: "Music",
                          artworkUrl100:"https://is2-ssl.mzstatic.com/image/thumb/Video125/v4/37/d7/b3/37d7b32d-90d2-762b-33bf-1b3cbe5b5690/source/100x100bb.jpg")
    }
}
