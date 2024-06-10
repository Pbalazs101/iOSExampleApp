//
//  OfferDetailsViewController.swift
//  ExampleApp
//
//  Created by Balázs Levente Pintér on 03/06/2024.
//

import UIKit

class OfferDetailsViewController: UIViewController,UITableViewDelegate, UIScrollViewDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var detailsScrollView: UIScrollView!
    @IBOutlet weak var extendedDescriptionLabel: UILabel!
    
    let backgroundColor:UIColor = UIColor(red: 245/255, green: 245.0/255, blue: 245/255, alpha: 1)
    
    override func viewWillAppear(_ animated: Bool) {
        setupStyle()
        configureRefreshControl()
        loadCardInfo()
        detailsScrollView.layoutIfNeeded()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        
        
    }
    
    func configureRefreshControl () {
       // Add the refresh control to your UIScrollView object.
        detailsScrollView.refreshControl = UIRefreshControl()
        detailsScrollView.refreshControl?.addTarget(self, action:
                                          #selector(handleRefreshControl),
                                          for: .valueChanged)
    }
        
    @objc func handleRefreshControl() {
       // Updating content. Here I have to reload the data and call the setLabels function to update the labels.
        setLabels()
        
       // Dismiss the refresh control.
       DispatchQueue.main.async {
          self.detailsScrollView.refreshControl?.endRefreshing()
       }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            scrollView.contentOffset.y = 0
        }
    }
    
    func setLabels() {
        titleLabel.text = cardsData[0].title
        descriptionLabel.text = cardsData[0].description
    }
    
    func setupStyle() {
        detailsScrollView.isScrollEnabled = true
        detailsScrollView.contentSize = CGSize(width: detailsScrollView.bounds.width, height: detailsScrollView.bounds.height)
    }
    
    
    

}
