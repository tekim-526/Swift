//
//  NotiDetailViewController.swift
//  Pass Data
//
//  Created by Kim TaeSoo on 2021/08/07.
//

import UIKit

class NotiDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }

    @IBAction func notiAction(_ sender: Any) {
        let notificationName = Notification.Name("sendSomeString")
        let strDic = ["str" : "noti string"]
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: strDic)
    }
    
   

}
