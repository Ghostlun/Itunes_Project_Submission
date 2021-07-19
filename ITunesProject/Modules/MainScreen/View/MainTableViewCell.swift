//
//  MainTableViewCell.swift
//  ITunesProject
//
//  Created by Yoonha Kim on 7/19/21.
//

import UIKit

class MainTableViewCell: UITableViewCell, CellReusable {
    
    @IBOutlet private weak var artistName: UILabel!
    @IBOutlet private weak var trackName: UILabel!
    @IBOutlet private weak var trackPrice: UILabel!
    @IBOutlet private weak var releaseDate: UILabel!
    @IBOutlet private weak var primaryGenreName: UILabel!
    @IBOutlet private weak var artistImage: UIImageView!
    var index = 0 {
        didSet {
            if index % 2 == 0 {
                self.contentView.backgroundColor = .systemGroupedBackground
            } else {
                self.contentView.backgroundColor = .white
            }
        }
    }
    
    func configure(data: MainTableCellViewModel) {
        artistName.text = data.artistName
        trackName.text = data.trackName
        trackPrice.text = data.trackPrice
        releaseDate.text = data.releaseDate
        primaryGenreName.text = data.primaryGenreName
        artistImage.downloadImage(with: data.imageUrl)
    }
}
