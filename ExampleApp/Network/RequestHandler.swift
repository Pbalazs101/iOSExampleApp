//
//  RequestHandler.swift
//  ExampleApp
//
//  Created by Balázs Levente Pintér on 06/06/2024.
//

import Foundation
import Alamofire
import Swinject
import SwinjectStoryboard

// Service
protocol NetworkingManager {
    func fetchData(_ url: String, completion: @escaping (_ success: Bool, _ data: Data?) -> Void)
}

// Component
public class NetworkService: NetworkingManager {
    /// Send an API request to obtain card info from JSON
    func fetchData(_ url: String, completion: @escaping (_ success: Bool, _ data: Data?) -> Void) {
        let url = URL(string: url)!
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                completion(true, data)
            } else {
                completion(false, nil)
            }
        }
        task.resume()
    }
}
