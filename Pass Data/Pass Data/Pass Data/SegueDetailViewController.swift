//
//  SegueDetailViewController.swift
//  Pass Data
//
//  Created by Kim TaeSoo on 2021/08/03.
//

import UIKit

class SegueDetailViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    
    var dataString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataLabel.text = dataString
    }
    

    
    

}
