//
//  ViewController.swift
//  Pass Data
//
//  Created by Kim TaeSoo on 2021/08/03.
//

// passing data (데이터를 넘겨주는 방법)
// 6 가지

// 1. instance property 를 넘겨주는 방법
// 2. segue "prepare"라는 함수를 이용함
// 3. instance를 통으로 넘겨주는 방법
// 4. delegate pattern (대리, 위임)
// 5. closure를 이용하는 방법
// 6. Notificatio - 연결점이 없어도 접근 호출이 가능 다른것 과는 차별점이 있다n

import UIKit

class ViewController: UIViewController {

    var someStrring = "" // 1번 방법 클래스 안에 속해 있으므로 property이다
    override func viewDidLoad() {
        super.viewDidLoad()
        // 6번 방법 Notification을 사용한 방법임 - 두번 호출 되지않게 주의 해야함
        let notificationName = Notification.Name("sendSomeString")
        NotificationCenter.default.addObserver(self, selector: #selector(showSomeString), name: notificationName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: notificationName, object: nil)
    }
    // 6번 방법 Notification을 사용한 방법임
    @objc func showSomeString(notification: Notification) {
        if let str = notification.userInfo?["str"] as? String {
            self.dataLabel.text = str

        }
    }
    @objc func keyboardWillShow() {
        print("will Show")
    }
    @objc func keyboardDidShow() {
        print("Did Show")
    }
    
    // 1번 방법 - instance property
    @IBAction func moveToDetail(_ sender: Any) {
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        // detailVC.someString = "aaa String"
        
        self.present(detailVC, animated: true, completion: nil) // 화면에 호출할 준비 끝
        detailVC.someLabel.text = "bb" //26번째 줄에 넣으면 크래쉬가 남 화면이 준비가 안되어 있기 때문에
    }
    
    // 2번 방법 prepare func을 사용한 segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueDetail") // identifier는 화살표 클릭해서 storyboard로 설정한 것 조건문을 통해 확인을 해 주어야 함
        {
            if let detailVC = segue.destination as? SegueDetailViewController {
                detailVC.dataString = "abcd"
            }
        }
    }
    
    // 3번 방법 - instance
    @IBOutlet weak var dataLabel: UILabel!
    @IBAction func moveToInstance(_ sender: Any) {
        let detailVC = InstanceDetailViewController(nibName: "InstanceDetailViewController", bundle: nil)
        
        detailVC.mainVC = self
        
        self.present(detailVC, animated: true, completion: nil)
        
    }
    
    // 4번 방법 - delegate
    @IBAction func moveToDelegate(_ sender: Any) {
        let detailVC = DelegateDetailViewController(nibName: "DelegateDetailViewController", bundle: nil)
        detailVC.delegate = self
        self.present(detailVC, animated: true, completion: nil)
    }
    
    // 5번 방법 - closure
    @IBAction func moveToClosure(_ sender: Any) {
        let detailVC = ClosureDetailViewController(nibName: "ClosureDetailViewController", bundle: nil)

        detailVC.myClosure = { str in
            self.dataLabel.text = str
        }
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    // 6번 방법 - Notification
    @IBAction func moveNoti(_ sender: Any) {
        let detailVC = NotiDetailViewController(nibName: "NotiDetailViewController", bundle: nil)
        self.present(detailVC, animated: true, completion: nil)
    }
}

extension ViewController: DelegateDetailViewControllerDelegate {
    func passString(string: String) {
        self.dataLabel.text = string
    }
}
