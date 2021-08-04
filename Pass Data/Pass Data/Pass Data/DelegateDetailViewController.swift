//
//  DelegateDetailViewController.swift
//  Pass Data
//
//  Created by Kim TaeSoo on 2021/08/04.
//

import UIKit

protocol DelegateDetailViewControllerDelegate: AnyObject {// delegate는 프로토콜을 준수할 때 사용
    func passString(string: String)
}

class DelegateDetailViewController: UIViewController {

    weak var delegate: DelegateDetailViewControllerDelegate?// 구현해놓은 위치에서 사용되고 없어지게끔 하기 위해 weak 로 선언함
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func passDataToMainVC(_ sender: Any) {
        delegate?.passString(string: "delegate pass Data")
        self.dismiss(animated: true, completion: nil)
    }
    
    
    

}
