//
//  ViewController.swift
//  ExampleApp
//
//  Created by Balázs Levente Pintér on 27/05/2024.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Test")
        //loadApiData()
        
    }
    
    
    
/*
    func loadApiData(){

            AF.request("file://Resources/CardData.json").responseDecodable(of: Card.self) { [self] response in

                switch response.result {

                case .success(let productData):
                    print("OK")

                case .failure(let productFetcherror):
                    print("Error")
                }
            }
        }
    
    */
}

