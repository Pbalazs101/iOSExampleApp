//
//  ViewController.swift
//  ExampleApp
//
//  Created by Balázs Levente Pintér on 27/05/2024.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        cardsTable.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        cardsTable.dataSource = self
        cardsTable.delegate = self
        configureRefreshControl()
        fetchData { _, data in
            do {
                let decoder = JSONDecoder()
                let actualCard = try decoder.decode(Card.self, from: data!)
                cardsData.append(Card(id: 0, title: actualCard.title, description: actualCard.description, detailedDescription: actualCard.detailedDescription))
                cardsData.append(Card(id: 1, title: actualCard.title, description: actualCard.description, detailedDescription: actualCard.detailedDescription))
                cardsData.append(Card(id: 2, title: actualCard.title, description: actualCard.description, detailedDescription: actualCard.detailedDescription))
            } catch let error {
                print(error)
            }
        }
        cardsTable.reloadData()
    }
    @IBOutlet weak var cardsTable: UITableView!

    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 93))

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
        let currentCard = cardsData[indexPath.row]
        // swiftlint:disable force_cast
        let customCell = cardsTable.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        // swiftlint:enable force_cast
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
        cardsTable.reloadData()
       DispatchQueue.main.async {
          self.cardsTable.refreshControl?.endRefreshing()
       }
    }
}
