//
//  AppError.swift
//  iTunesProject
//
//  Created by Yoonha Kim on 7/19/21.
//

import Foundation

enum AppError: Error {
    
    case badUrl
    case serverError
    case badResponse
    case noData
    case parsingFail
    case dequeueCellFailed
    case dataSourceMissing
    case dataUnwrappedFailed
}
