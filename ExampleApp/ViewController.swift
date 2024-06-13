//
//  ViewController.swift
//  ExampleApp
//
//  Created by Balázs Levente Pintér on 27/05/2024.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate {

    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardsTable.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        
        cardsTable.dataSource = self
        cardsTable.delegate = self
        setupStyle()
        configureRefreshControl()
        loadCardInfo()
        cardsTable.reloadData()

    }
    
    @IBOutlet weak var cardsTable: UITableView!

    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    

    /*
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Test Header"
    }
     */
    
    
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
        let customCell = cardsTable.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        customCell.titleLabel.text = currentCard.title
        customCell.descriptionLabel.text = currentCard.description
        
        return customCell
    }
    
    /*
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            scrollView.contentOffset.y = 0
        }
    }
    */
    func setupStyle() {
        view.layoutIfNeeded()
    }
    
    func configureRefreshControl () {
       // Add the refresh control to your UIScrollView object.
        cardsTable.refreshControl = UIRefreshControl()
        cardsTable.refreshControl?.addTarget(self, action:
                                          #selector(handleRefreshControl),
                                          for: .valueChanged)
    }
        
    @objc func handleRefreshControl() {
       // Updating content. Here I have to reload the data and call the setLabels function to update the labels.
        //loadCardInfo()
        print("Test refresh control")
        cardsTable.reloadData()
        
       // Dismiss the refresh control.
       DispatchQueue.main.async {
          self.cardsTable.refreshControl?.endRefreshing()
       }
    }
    
}

