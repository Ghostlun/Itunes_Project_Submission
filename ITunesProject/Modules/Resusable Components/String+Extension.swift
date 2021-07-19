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
    
    func dateFormatter() -> String {
        let start = self.index(self.startIndex, offsetBy: 0)
        let end = self.index(self.startIndex, offsetBy: 9)
        let range = start...end
        let dateText = String(self[range])
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let formattedDate = formatter.date(from: dateText) else { return ""}
        return formatter.string(from: formattedDate)
    }
}
