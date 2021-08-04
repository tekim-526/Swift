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


import UIKit

class ViewController: UIViewController {

    var someStrring = "" // 1번 방법 클래스 안에 속해 있으므로 property이다
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // 3번 방법
    @IBOutlet weak var dataLabel: UILabel!
    
    // 2번 방법 prepare func을 사용한 segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueDetail") // identifier는 화살표 클릭해서 storyboard로 설정한 것 조건문을 통해 확인을 해 주어야 함
        {
            if let detailVC = segue.destination as? SegueDetailViewController {
                detailVC.dataString = "abcd"
            }
        }
    }
    @IBAction func moveToDetail(_ sender: Any) {
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        // 1번 방법
        // detailVC.someString = "aaa String"
        
        self.present(detailVC, animated: true, completion: nil) // 화면에 호출할 준비 끝
        detailVC.someLabel.text = "bb" //26번째 줄에 넣으면 크래쉬가 남 화면이 준비가 안되어 있기 때문에

    }
    
    @IBAction func moveToInstance(_ sender: Any) {
        let detailVC = InstanceDetailViewController(nibName: "InstanceDetailViewController", bundle: nil)
        
        detailVC.mainVC = self
        
        self.present(detailVC, animated: true, completion: nil)
        
    }
}

