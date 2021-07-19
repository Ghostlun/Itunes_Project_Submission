//
//  MainViewModelDelegate.swift
//  ITunesProject
//
//  Created by Yoonha Kim on 7/19/21.
//

import Foundation
class MainViewModelDelegate: MainViewModelProtocol {
    
    var isReloaded = false
    var isLoading = false
    var hasStoppedLoading = false
    var errorReceived: AppError?
    
    func reloadData() {
        isReloaded = true
    }
    
    func showLoader() {
        isLoading = true
    }
    
    func hideLoader() {
        hasStoppedLoading = true
    }
    
    func didFailWith(error: AppError) {
        errorReceived = error
    }
}
