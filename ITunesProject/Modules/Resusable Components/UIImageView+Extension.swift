//
//  UIImageView+Extension.swift
//  ITunesProject
//
//  Created by Yoonha Kim on 7/19/21.
//

import Foundation
import UIKit

extension UIImageView {
    
    static var cache = ImageCache()
    
    func downloadImage(with url: String?) {
        guard let unwrappedUrl = url, let finalUrl = URL(string: unwrappedUrl) else {
            self.image = UIImage(named: "errorIcon.png")
            return
        }
        if let image = UIImageView.cache.getImage(for: NSString(string: unwrappedUrl)) {
            self.image = image
        }
        URLSession.shared.dataTask(with: finalUrl) {data, _, _ in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                guard let image = UIImage(data: data) else { return }
                UIImageView.cache.saveImage(image, for: NSString(string: unwrappedUrl))
                self.image = image
            }
        }
        .resume()
    }
}
