//
//  Card.swift
//  ExampleApp
//
//  Created by Balázs Levente Pintér on 28/05/2024.
//

import Foundation

protocol CardDisplayable {
    var id: Int {get}
    var title: String {get}
    var description: String {get}
    var detailedDescription: String {get}
}

/// Representing a single card displayed on the Offers page
public struct Card: CardDisplayable, Codable {
    var id: Int
    var title: String
    var description: String
    var detailedDescription: String
}
