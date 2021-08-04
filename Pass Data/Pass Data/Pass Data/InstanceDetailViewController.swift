//
//  InstanceDetailViewController.swift
//  Pass Data
//
//  Created by Kim TaeSoo on 2021/08/03.
//

import UIKit

class InstanceDetailViewController: UIViewController {

    var mainVC: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func sendDataMainVC(_ sender: Any) {
        mainVC?.dataLabel.text = "some data"
    }
    

}
