//
//  ITunesData.swift
//  ITunesProject
//
//  Created by Yoonha Kim on 7/19/21.
//

import Foundation

struct ITunesData: Decodable {
    var resultCount: Int
    var results: [ArtistInformation]
}

struct ArtistInformation: Decodable {
    var artistName: String?
    var trackName: String?
    var trackPrice: Double?
    var releaseDate: String?
    var primaryGenreName: String?
    var artworkUrl100: String?
}
