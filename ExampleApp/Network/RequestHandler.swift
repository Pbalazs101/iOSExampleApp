//
//  RequestHandler.swift
//  ExampleApp
//
//  Created by Balázs Levente Pintér on 06/06/2024.
//

import Foundation
import Alamofire

var cardsData: [Card] = []

/// Send an API request to obtain card info from JSON
func fetchData(_ completion: @escaping (_ success: Bool, _ data: Data?) -> Void) {
   let url = URL(string: "http://localhost:8000/CardData.json")!
   let task = URLSession.shared.dataTask(with: url) { data, _, _ in
      if let data = data {
         completion(true, data)
      } else {
         completion(false, nil)
      }
   }
   task.resume()
}

public func setupData(card: Card, numberOfCards: Int) {
    for _ in 0..<numberOfCards {
        cardsData.append(Card(id: card.id, title: card.title, description: card.description, detailedDescription: card.detailedDescription))
    }
}
