//
//  ViewController.swift
//  App_Start
//
//  Created by Kim TaeSoo on 2021/07/30.
//

import UIKit

// 실행 command + R

fileprivate enum SomeStyle { // fileprivate 다른 파일에서 접근 못함
    case aa
}
fileprivate struct SomeStruct {
    var aaa = ""
}

class ViewController: UIViewController {
    fileprivate struct SomeStruct { // 클래스 안에 넣어서 구조체를 여기서만 쓰겠다고 명시함 클래스 안에 enum, class, struct, func 등등 가능 밀접하게 연결 되어 있으면 한파일에 넣는다. 아니면 파일을 따로 만드는게 좋음
        var aaa = ""
    }

    @IBOutlet weak var testButton: UIButton!
    // IBOutlet 화면이랑 연계되어 있는 변수
    @IBAction func do_something(_ sender: Any) {
        testButton.backgroundColor = .orange
        
        // DetailVC 인스턴스
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // name = 스토리보드 파일 이름
        let detailVC = storyboard.instantiateViewController(identifier: "DetailVC") as DetailVC //스토리보드 ID = identifier 보통 class이름과 똑같이 만듬
        
        // DetailVC로 이동
        self.present(detailVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        testButton.backgroundColor = UIColor.red
    }


}

