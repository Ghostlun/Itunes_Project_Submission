//
//  ITunesProjectTests.swift
//  ITunesProjectTests
//
//  Created by Yoonha Kim on 7/19/21.
//
@testable import ITunesProject
import XCTest

class MainViewModelTests: XCTestCase {
    
    var mainViewModel: MainViewModel!
    var delegate: MainViewModelDelegate!
    
    override func setUp() {
        super.setUp()
        delegate = MainViewModelDelegate()
        mainViewModel = MainViewModel(delegate: delegate)
    }
    
    override func tearDown() {
        mainViewModel = nil
        super.tearDown()
    }
    
    func testNumberOfRows() {
        mainViewModel.artistInformationDataSource.append(getArtistInformation())
        mainViewModel.artistInformationDataSource.append(getArtistInformation())
        mainViewModel.artistInformationDataSource.append(getArtistInformation())
        XCTAssertEqual(mainViewModel.numberOfRowsInSection(), 3)
    }
    
    func testITunesDataAtIndex() {
        let newDataInformation = ArtistInformation(artistName: "testName1", trackName: "testTrackName1", trackPrice: 6.0, releaseDate: "2021-07-09T07:00:00Z", primaryGenreName: "Music")
        mainViewModel.artistInformationDataSource.append(getArtistInformation())
        mainViewModel.artistInformationDataSource.append(newDataInformation)
        let mainListViewModelProtocolData = mainViewModel.iTunesData(at: 1)
        XCTAssertEqual(mainListViewModelProtocolData.trackName, "testTrackName1")
    }
    
    func testMainViewModelDelegate() {
        mainViewModel.searchInformation(with: "bts")
        let artistExpectation = expectation(description: "artist")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            artistExpectation.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
        XCTAssertTrue((delegate.isReloaded))
        XCTAssertTrue((delegate.isLoading))
        XCTAssertTrue((delegate.hasStoppedLoading))
    }
    
    func testDidFailedWithNoResults() {
        mainViewModel.searchInformation(with: "")
        let artistExpectation = expectation(description: "artist")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            artistExpectation.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
        XCTAssertEqual(mainViewModel.artistInformationDataSource.count, 0)
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
