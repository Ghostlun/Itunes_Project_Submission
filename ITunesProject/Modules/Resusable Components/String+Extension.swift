//
//  String+extension.swift
//  ITunesProject
//
//  Created by Yoonha Kim on 7/19/21.
//

import Foundation

extension String {
    
    var stringRemovingWhitespaces: String {
        components(separatedBy: .whitespaces).joined()
    }
    
    func getSubString(fromIndex: Int, toIndex: Int) -> String {
        let start = self.index(self.startIndex, offsetBy: fromIndex)
        let end = self.index(self.startIndex, offsetBy: toIndex)
        let range = start...end
        return String(self[range])
    }
}
