//
//  MainViewController.swift
//  ITunesProject
//
//  Created by Yoonha Kim on 7/19/21.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Variables Declarations
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.register(UINib(nibName: MainTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: MainTableViewCell.reuseIdentifier)
            self.tableView.tableFooterView = UIView()
        }
    }
    
    @IBOutlet private weak var artistNameTextField: UITextField!
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView! {
        didSet {
            self.activityIndicatorView.hidesWhenStopped = true
        }
    }
    
    lazy var mainListViewModel = MainViewModel(delegate: self)
    
    // MARK: - view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicatorView.center = self.view.center
    }
    
    // MARK: - @IBAction searchArtist
    @IBAction private func searchArtist() {
        guard let artistName = artistNameTextField.text?.stringRemovingWhitespaces, !artistName.isEmpty else { return }
        mainListViewModel.searchInformation(with: artistName)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = mainListViewModel.iTunesData(at: indexPath.row)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseIdentifier, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        cell.configure(data: data)
        cell.index = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if mainListViewModel.numberOfRowsInSection() == 0 {
            return "No Results"
        }
        return nil
    }
}

extension MainViewController: MainViewModelProtocol {
    
    func showLoader() {
        self.activityIndicatorView.startAnimating()
    }
    
    func hideLoader() {
        self.activityIndicatorView.stopAnimating()
    }
    
    func reloadData() {
        self.tableView?.reloadData()
    }
    
    func didFailWith(error: AppError) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}
