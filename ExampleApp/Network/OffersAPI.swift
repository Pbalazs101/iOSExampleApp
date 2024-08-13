//
//  OffersAPI.swift
//  ExampleApp
//
//  Created by Balázs Levente Pintér, Vodafone Hungary on 13/08/2024.
//

import Foundation
import Moya

enum OffersAPI {
    case getCardsInfo
}

extension OffersAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "http://localhost:8000") else { fatalError() }
        return url
    }

    var path: String {
        switch self {
        case .getCardsInfo:
            return "/CardData.json"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getCardsInfo:
            return .get
        }
    }

    var task: Moya.Task {
        return .requestPlain
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
