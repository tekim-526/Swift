//
//  ViewController.swift
//  PanGestureApp
//
//  Created by Kim TaeSoo on 2021/08/17.
//

import UIKit

enum DragType {
    case x
    case y
    case none
}

class ViewController: UIViewController {

    var dragType = DragType.none
    let myView = DragableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        myView.center = self.view.center
        myView.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        myView.dragType = .x
        myView.backgroundColor = .red
        
        self.view.addSubview(myView)
    }
    
    @IBAction func selectPanType(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {//인덱스로 받기 때문에 왼쪽에 있는것이 0 오른쪽에 있는게 1이됨 더 있다면 오름차순으로 하나씩 늘어남
        case 0:
            dragType = .x
        case 1:
            dragType = .y
        case 2:
            dragType = .none
        default:
            break
        }
        
        myView.dragType = self.dragType
        
    }
    

}

