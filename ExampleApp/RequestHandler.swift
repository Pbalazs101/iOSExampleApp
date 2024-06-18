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
func loadCardInfo() {
    let url = "http://localhost:8000/CardData.json"
    AF.request(url).response {
        response in
        guard let data = response.data else { return }
        do {
            let decoder = JSONDecoder()
            let actualCard = try decoder.decode(Card.self, from: data)
            cardsData.append(Card(id: 0, title: actualCard.title, description: actualCard.description, detailedDescription: actualCard.detailedDescription))
            cardsData.append(Card(id: 1, title: actualCard.title, description: actualCard.description, detailedDescription: actualCard.detailedDescription))
            cardsData.append(Card(id: 2, title: actualCard.title, description: actualCard.description, detailedDescription: actualCard.detailedDescription))
        } catch let error {
            print(error)
        }
    }
}

func fetchData(_ completion: @escaping (_ success: Bool, _ data: Data?) -> Void) {
    
   // Build an URL
   let url = URL(string: "http://localhost:8000/CardData.json")!
    
   // Perform the network request
   let task = URLSession.shared.dataTask(with: url) { data, response, error in
      if let data = data {
         // Success, call the completion handler with the data
         completion(true, data)
      } else {
         // Failure, call the completion handler with nil data
         completion(false, nil)
      }
   }
   task.resume()
}
