//
//  OfferDetailsViewController.swift
//  ExampleApp
//
//  Created by Balázs Levente Pintér on 03/06/2024.
//

import UIKit

class OfferDetailsViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var detailsScrollView: UIScrollView!
    @IBOutlet weak var extendedDescriptionLabel: UILabel!
    
    let backgroundColor:UIColor = UIColor(red: 245/255, green: 245.0/255, blue: 245/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsScrollView.isScrollEnabled = true
        detailsScrollView.contentSize = CGSize(width: detailsScrollView.bounds.width, height: detailsScrollView.bounds.height+1)
        
        //view.backgroundColor = backgroundColor

    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            scrollView.contentOffset.y = 0
        }
    }
    
    

}
