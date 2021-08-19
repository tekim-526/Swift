//
//  ClosureDetailViewController.swift
//  Pass Data
//
//  Created by Kim TaeSoo on 2021/08/05.
//

import UIKit

class ClosureDetailViewController: UIViewController {

    var myClosure: ((String) -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func closurePassData(_ sender: Any) {
        myClosure?("closure string")
        self.dismiss(animated: true, completion: nil)
    }
    
}
