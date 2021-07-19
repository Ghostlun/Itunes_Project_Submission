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
            self.tableView.register(UINib(nibName: MainTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: MainTableViewCell.reuseIdentifier)}
    }
    
    @IBOutlet private weak var artistNameTextField: UITextField!
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView! {
        didSet {
            self.activityIndicatorView.hidesWhenStopped = true
        }
    }
    
    
    // MARK: - viewDidload
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicatorView.center = self.view.center
    }
    
    // MARK: - @IBAction searchArtist
    @IBAction private func searchArtist() {
        guard let artistName = artistNameTextField.text else { return }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      return UITableViewCell()
    }
}
