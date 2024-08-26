//
//  ViewController.swift
//  ExampleApp
//
//  Created by Balázs Levente Pintér on 27/05/2024.
//

import UIKit
import Alamofire
import Moya

class OffersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate {

    var networkService: NetworkingManager?

    private let networkManager: NetworkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardsTable.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        cardsTable.dataSource = self
        cardsTable.delegate = self
        configureRefreshControl()

        DispatchQueue.global(qos: .userInitiated).async {
            self.loadCardData()
        }

    }
    @IBOutlet weak var cardsTable: UITableView!

    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 93))

    // Factory?
    func loadCardData() {
        // startLoading()
        networkService?.fetchData { [weak self] result in
            guard let weakSelf = self else { return }
            // weakSelf.stopLoading()
            switch result {
            case .success(let cardResponse):
                cardsData = cardResponse
                weakSelf.cardsTable.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        label.textAlignment = .left
        label.text = "Special Offers"
        return label
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let offerDetailsVC = storyBoard.instantiateViewController(identifier: "OfferDetails")
                self.navigationController?.pushViewController(offerDetailsVC, animated: true)
        }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardsData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let customCell = cardsTable.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell else {
            fatalError("Cannot load custom cell")
        }
        return customCell
    }

    func setupStyle() {
        view.layoutIfNeeded()
    }

    func configureRefreshControl () {
        cardsTable.refreshControl = UIRefreshControl()
        cardsTable.refreshControl?.addTarget(self, action:
                                          #selector(handleRefreshControl),
                                          for: .valueChanged)
    }

    @objc func handleRefreshControl() {
        guard let networkService = networkService else {
            return
        }
        DispatchQueue.global(qos: .userInitiated).async {
            self.loadCardData()
            DispatchQueue.main.async {
                self.cardsTable.refreshControl?.endRefreshing()
                self.cardsTable.reloadData()
            }
        }

        cardsTable.reloadData()
       DispatchQueue.main.async {
          self.cardsTable.refreshControl?.endRefreshing()
       }
    }
}
