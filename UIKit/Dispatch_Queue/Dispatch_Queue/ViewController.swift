//
//  ViewController.swift
//  Dispatch_Queue
//
//  Created by Kim TaeSoo on 2021/08/08.
//

import UIKit

class ViewController: UIViewController {

    // dispatch queue - 스레드를 여러개로 만들어서 관리하는 것
    
    @IBOutlet weak var finishLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    // 타이머 만듬
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.timerLabel.text = Date().timeIntervalSince1970.description
        }
    }
    
    // 제일 위의 버튼
    @IBAction func action1(_ sender: Any) {
        simpleClosure {
            self.finishLabel.text = "끝"
        }
    }
    
    func simpleClosure(completion: @escaping () -> Void/*정의 한 것*/) {
        DispatchQueue.global().async {
            for index in 0..<10 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
        }
        DispatchQueue.main.async {
            completion()
        }
    }
    
    // 가운데 있는 버튼
    @IBAction func action2(_ sender: Any) {
        let dispatchGroup = DispatchGroup()
        let queue1 = DispatchQueue(label: "q1")
        let queue2 = DispatchQueue(label: "q2")
        let queue3 = DispatchQueue(label: "q3")

        // async는 위에 뭐가 있건 각각 실행되게 끔함 -> 하나의 작업자안에 있으면 순서대로 queue2,queue3 가 queque1 이라면 밑에가 실행되면 순서대로 진행됨
        // 작업이 끝났다고 생각하는 key 값을 수동으로 정해 줄 수 있음 .enter, .leave 키워드를 사용 enter를 쓰면 leave를 해주어야 끝났다는걸 알 수 있음 -> leave가 잘되어 있는지 테스팅 해 보아야함!
        // qos를 사용하면 우선순위를 정할 수 있음
        // 우선순위에서 .background는 가장 낮은 것, .userInteractive는 높은 것 순서는 command 키를 이용한 정의부 가서 확인 하자
        // 모든게 우선순위로 되는 것이 아니라 대체로 그렇다는 의미이다. 무조건 가장 높게 처리하는 것이 아님
        // 순서에 대한 보장이 아니라 대략적으로 우선순위에 따라 빠르거나 느리게 처리함
        queue1.async(group: dispatchGroup, qos: .background) { // (.background) 밀려서 실행됨
            dispatchGroup.enter()
            DispatchQueue.global().async {
                for index in 0..<10 {
                    Thread.sleep(forTimeInterval: 0.2)
                    print(index)
                }
            dispatchGroup.leave()
            }
        }
        queue2.async(group: dispatchGroup, qos: .userInteractive) { // (.userInteractive) 비교적 빨리 처리됨
            dispatchGroup.enter()
            DispatchQueue.global().async {
                for index in 10..<20 {
                    Thread.sleep(forTimeInterval: 0.2)
                    print(index)
                }
            dispatchGroup.leave()
            }
        }
        queue3.async(group: dispatchGroup) {
            dispatchGroup.enter()
            DispatchQueue.global().async {
                for index in 20..<30 {
                    Thread.sleep(forTimeInterval: 0.2)
                    print(index)
                }
            dispatchGroup.leave()

            }
        }
        // notify는 작업이 다 완료되었을 때 실행되는 것임, DispatchQueue.global~~이 감싸고 있으면 for문이 실행 되건 말건 작업을 다 했다고 생각함 (개인적인 생각으로는 코드를 읽는 depth의 차이라고 생각함)
        dispatchGroup.notify(queue: DispatchQueue.main) {
            print("끝")
        }
    }
    
    // 제일 밑에 있는 버튼
    @IBAction func action3(_ sender: Any) {
        /* 메인에서는 sync를 사용하면 실행이 불가능함 메인 스레드는 끝나는 개념이 없기 때문
        DispatchQueue.main.async {
            print("main sync")
        }
        */
        
        
        let queue1 = DispatchQueue(label: "q1")
        let queue2 = DispatchQueue(label: "q2")
        // sync -> sync의 작업을 완료할때까지 다른 스레드의 작업을 멈추고 기다리게 함 <-> async와 반대의 개념임
        // 순차적으로 작업을 해야할 때 사용하는데 자주 쓸일은 없다.
        queue1.sync {
            for index in 0..<10 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
            // deadlock -> 상대 작업이 끝날때까지 서로 계속 기다리는 상태, sync async 둘다 이 상황에서는 deadlock 발생
            // queue2로 하면 작업을 함
            /*queue1.sync {
                for index in 0..<10 {
                    Thread.sleep(forTimeInterval: 0.2)
                    print(index)
                }
            }*/
        }
        queue2.sync {
            for index in 10..<20 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
        }
    }
}

