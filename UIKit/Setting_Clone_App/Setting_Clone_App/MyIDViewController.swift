//
//  MyIDViewController.swift
//  Setting_Clone_App
//
//  Created by Kim TaeSoo on 2021/08/12.
//

import UIKit

class MyIDViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var nextButton: UIButton! {
        didSet{
            nextButton.isEnabled = false // 버그 처리, 예외 처리 방법 3 뭐가 가장 좋을지는 생각해보자
        }
    }
    @IBOutlet weak var emailTextField: UITextField!
    // 뒤로 가기
    @IBAction func doCancel(_ sender: Any) {
        //self.dismiss는 내리는 옵션임
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled = false // 버그 처리, 예외 처리 방법 1

        // editingChanged는 암기해야함 -> 글자가 입력되거나 삭제될 때 이벤트를 주겠다라는 의미
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        textFieldDidChange(sender: emailTextField) // 버그 처리, 예외 처리 방법 2
    }


    @objc func textFieldDidChange(sender: UITextField) {
        if sender.text?.isEmpty == true {
            nextButton.isEnabled = false
        }
        else{
            nextButton.isEnabled = true
        }
    }

}
