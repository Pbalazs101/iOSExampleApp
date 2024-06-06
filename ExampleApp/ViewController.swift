//
//  ViewController.swift
//  ExampleApp
//
//  Created by Balázs Levente Pintér on 27/05/2024.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    override func viewDidLoad() {
        super.viewDidLoad()
        cardsTable.dataSource = self
        cardsTable.delegate = self
        
        loadCardInfo()
        
    }
    
    @IBOutlet weak var cardsTable: UITableView!
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("clicked")

        }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let currentCard = cardsData[indexPath.row]
        let customCell = cardsTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CardTableViewCell
        
        customCell.titleLabel.text = currentCard.title
        customCell.descriptionLabel.text = currentCard.description
        
        return customCell
    }
    
}

