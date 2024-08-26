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
import Moya

// Service
protocol NetworkingManager {
    var provider: MoyaProvider<OffersAPI> { get }

    func fetchData(_ completion: @escaping (Result<[Card], Error>) -> ())
}

// Component
public class NetworkManager: NetworkingManager {

    var provider = MoyaProvider<OffersAPI>(plugins: [NetworkLoggerPlugin()])

    /// Send an API request to obtain card info from JSON
    func fetchData(_ completion: @escaping (Result<[Card], Error>) -> ()) {

        request(target: .getCardsInfo, completion: completion)

        /*
        let url = URL(string: url)!
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                completion(true, data)
            } else {
                completion(false, nil)
            }
        }
        task.resume()
         */
    }
}

private extension NetworkManager {
    private func request<T: Decodable>(target: OffersAPI, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
