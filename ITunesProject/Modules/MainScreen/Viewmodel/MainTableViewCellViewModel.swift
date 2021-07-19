//
//  MainTableViewCellViewModel.swift
//  ITunesProject
//
//  Created by Yoonha Kim on 7/19/21.
//

import Foundation
protocol MainTableCellViewModelProtocol: AnyObject {
    var artistName: String { get }
    var trackName: String { get }
    var releaseDate: String { get }
    var trackPrice: String { get }
    var primaryGenreName: String { get }
    var imageUrl: String { get }
}

class MainTableCellViewModel: MainTableCellViewModelProtocol {
    
    // MARK: - Variables Declarations
    private var information: ArtistInformation
    
    // MARK: - Init
    init(info: ArtistInformation) {
        self.information = info
    }
    
    // MARK: - Computational Properties
    var artistName: String {
        information.artistName ?? ""
    }
    
    var trackName: String {
        information.trackName ?? ""
    }
    
    var releaseDate: String {
        (information.releaseDate ?? "").getSubString(fromIndex: 0, toIndex: 9)
    }
    
    var trackPrice: String {
        "$\(information.trackPrice ?? 0)"
    }
    
    var primaryGenreName: String {
        "Genre: \(information.primaryGenreName ?? "")"
    }
    
    var imageUrl: String {
        information.artworkUrl100 ?? ""
    }
}
