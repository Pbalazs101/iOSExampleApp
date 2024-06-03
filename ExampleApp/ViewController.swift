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
        
        /*
        cardsTable.setNeedsLayout()
        cardsTable.layoutIfNeeded()
         */
    }
    
    @IBOutlet weak var cardsTable: UITableView!
    
    var cardsData: [Card] = []
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked")
    }
    
    func loadCardInfo() {
        
        let url = "http://localhost:8000/CardData.json"
        AF.request(url).response {
            response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let actualCard = try decoder.decode(Card.self, from: data)
                self.cardsData.append(Card(id: 0, title: actualCard.title, description: actualCard.description))
                self.cardsData.append(Card(id: 1, title: actualCard.title, description: actualCard.description))
                self.cardsData.append(Card(id: 2, title: actualCard.title, description: actualCard.description))
            } catch let error {
                print(error)
            }
        }
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

