//
//  ViewController.swift
//  OnboardingViewApp
//
//  Created by Kim TaeSoo on 2021/08/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // 보통 viewDidAppear 쪽에다가 많이함 -> 라이프 사이클에 대한 이해가 많이 필요함
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let pageVC = OnboardingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: .none)
        pageVC.modalPresentationStyle = .fullScreen
        self.present(pageVC, animated: true, completion: nil)
    }

}

