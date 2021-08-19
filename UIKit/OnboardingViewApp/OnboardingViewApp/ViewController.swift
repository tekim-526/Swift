//
//  ViewController.swift
//  OnboardingViewApp
//
//  Created by Kim TaeSoo on 2021/08/18.
//

import UIKit

class ViewController: UIViewController {

    var didShowOnboardingView = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // 보통 viewDidAppear 쪽에다가 많이함 -> 라이프 사이클에 대한 이해가 많이 필요함
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 앱이 실행되있는동안에만 메모리상에 올려놓는 방법, 영구적으로 저장하려면 userdefault라는 개념으로 로컬에 저장
        if didShowOnboardingView == false{
            didShowOnboardingView = true
            let pageVC = OnboardingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: .none)
        pageVC.modalPresentationStyle = .fullScreen
        self.present(pageVC, animated: true, completion: nil)
        }
    }

}

