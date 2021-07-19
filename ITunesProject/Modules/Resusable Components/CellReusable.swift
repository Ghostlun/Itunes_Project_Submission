//
//  CellReusable.swift
//  iTunesProject
//
//  Created by Yoonha Kim on 7/19/21.
//

import Foundation

protocol CellReusable {
    static var reuseIdentifier: String { get }
}

extension CellReusable {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
