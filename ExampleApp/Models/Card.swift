//
//  Card.swift
//  ExampleApp
//
//  Created by Balázs Levente Pintér on 28/05/2024.
//

import Foundation

/// Representing a single card displayed on the Offers page
public struct Card: Codable {
    var id: Int
    var title: String
    var description: String
    var detailedDescription: String
}
