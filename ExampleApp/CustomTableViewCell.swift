//
//  CustomTableViewCell.swift
//  ExampleApp
//
//  Created by Balázs Levente Pintér on 13/06/2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    static let identifier = "customCell"
    static func nib() -> UINib {
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }
    public func setupData() {
        titleLabel.text = cardsData[0].title
        descriptionLabel.text = cardsData[0].description
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setupData()
    }
}
