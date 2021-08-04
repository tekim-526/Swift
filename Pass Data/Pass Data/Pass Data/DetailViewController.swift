//
//  DetailViewController.swift
//  Pass Data
//
//  Created by Kim TaeSoo on 2021/08/03.
//

import UIKit

class DetailViewController: UIViewController {

    var someString = "tekim"
   
    @IBOutlet weak var someLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        someLabel.text = someString
    }


}
