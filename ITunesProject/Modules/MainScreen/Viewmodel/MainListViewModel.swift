//
//  MainListViewModel.swift
//  ITunesProject
//
//  Created by Yoonha Kim on 7/19/21.
//

import Foundation

protocol MainViewModelProtocol: AnyObject {
    func reloadData()
    func showLoader()
    func hideLoader()
    func didFailWith(error: AppError)
}

class MainViewModel {
    // MARK: - Variables Declarations
    weak var delegate: MainViewModelProtocol?
    var artistInformationDataSource: [ArtistInformation] = []
    
    // MARK: - Init
    init (delegate: MainViewModelProtocol) {
        self.delegate = delegate
    }
    
    // MARK: - Function
    func numberOfRowsInSection() -> Int {
        artistInformationDataSource.count
    }
    
    func iTunesData(at index: Int) -> MainTableCellViewModel {
        MainTableCellViewModel(info: artistInformationDataSource[index])
    }
    
    func searchInformation(with artist: String) {
        let searchInformation = artist.stringRemovingWhitespaces
        self.delegate?.showLoader()
        NetworkManager.manager.fetch(url: "https://itunes.apple.com/search?term=\(searchInformation)") { [weak self] (result: Result<ITunesData, AppError>) in
            self?.delegate?.hideLoader()
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.artistInformationDataSource = data.results
                self.delegate?.reloadData()
                
            case .failure(let error):
                self.delegate?.didFailWith(error: error)
            }
        }
    }
    
   
}
