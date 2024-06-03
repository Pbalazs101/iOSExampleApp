//
//  ViewController.swift
//  ExampleApp
//
//  Created by Balázs Levente Pintér on 27/05/2024.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        loadCardInfo()
    }
    
    @IBOutlet weak var cardsTable: UITableView!
    
    func loadCardInfo() {
        
        let url = "http://localhost:8000/CardData.json"
        AF.request(url).response {
            response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let actualCard = try decoder.decode(Card.self, from: data)
            } catch let error {
                print(error)
            }
        }
    }
}

