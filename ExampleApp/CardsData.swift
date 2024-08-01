//
//  CardsData.swift
//  ExampleApp
//
//  Created by Balázs Levente Pintér on 01/08/2024.
//

import Foundation

var cardsData: [Card] = []

public func setupData(card: Card, numberOfCards: Int) {
    for currentID in 0..<numberOfCards {
        cardsData.append(Card(id: currentID, title: card.title, description: card.description, detailedDescription: card.detailedDescription))
    }
}
