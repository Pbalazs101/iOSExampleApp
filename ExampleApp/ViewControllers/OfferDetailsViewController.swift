//
//  OfferDetailsViewController.swift
//  ExampleApp
//
//  Created by Balázs Levente Pintér on 03/06/2024.
//

import UIKit

class OfferDetailsViewController: UIViewController, UITableViewDelegate, UIScrollViewDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var backToRootButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var detailsScrollView: UIScrollView!
    @IBOutlet weak var extendedDescriptionLabel: UILabel!
    let backgroundColor: UIColor = UIColor(red: 245/255, green: 245.0/255, blue: 245/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setupStyle()
        configureRefreshControl()
        detailsScrollView.layoutIfNeeded()
        setLabels()
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backToRootButton.addTarget(self, action: #selector(backToRootButtonTapped), for: .touchUpInside)
    }

    @objc private func backButtonTapped() {
        _ = navigationController?.popViewController(animated: true)
    }

    @objc private func backToRootButtonTapped() {
        _ = navigationController?.popToRootViewController(animated: true)
    }

    func configureRefreshControl () {
        detailsScrollView.refreshControl = UIRefreshControl()
        detailsScrollView.refreshControl?.addTarget(self, action:
                                          #selector(handleRefreshControl),
                                          for: .valueChanged)
    }

    @objc func handleRefreshControl() {
        setLabels()
       DispatchQueue.main.async {
          self.detailsScrollView.refreshControl?.endRefreshing()
       }
    }

    func setLabels() {
        titleLabel.text = cardsData[0].title
        descriptionLabel.text = cardsData[0].description
        extendedDescriptionLabel.text = cardsData[0].detailedDescription
        extendedDescriptionLabel.lineBreakMode = .byWordWrapping
    }

    func setupStyle() {
        detailsScrollView.isScrollEnabled = true
        detailsScrollView.contentSize = CGSize(width: detailsScrollView.bounds.width, height: detailsScrollView.bounds.height)
        detailsScrollView.layer.backgroundColor = backgroundColor.cgColor
    }
}
