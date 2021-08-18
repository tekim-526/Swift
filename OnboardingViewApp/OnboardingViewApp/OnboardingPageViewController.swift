//
//  OnboardingPageViewController.swift
//  OnboardingViewApp
//
//  Created by Kim TaeSoo on 2021/08/18.
//

import UIKit

class OnboardingPageViewController: UIPageViewController {

    // 여러개의 page를 담을 array가 필요
    var pages = [UIViewController]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let itemVC1 = OnboardingItemViewController.init(nibName: "OnboardingItemViewController", bundle: nil)
        /*메모리에 올라가기 전이라 에러가 나옴 onboardingitemviewcontroller에서 이니셜라이즈 필요
        itemVC1.mainTitleLabel.text = "first"
        */
        itemVC1.topImage = UIImage(named: "onboarding1")
        itemVC1.mainText = "Focus on your ideal buyer"
        itemVC1.subText = "when you write a product description ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        let itemVC2 = OnboardingItemViewController.init(nibName: "OnboardingItemViewController", bundle: nil)
        itemVC2.topImage = UIImage(named: "onboarding2")
        itemVC2.mainText = "Focus on your ideal buyer"
        itemVC2.subText = "when you write a product description ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        
        let itemVC3 = OnboardingItemViewController.init(nibName: "OnboardingItemViewController", bundle: nil)
        itemVC3.topImage = UIImage(named: "onboarding3")
        itemVC3.mainText = "Focus on your ideal buyer"
        itemVC3.subText = "when you write a product description ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        
        pages.append(itemVC1)
        pages.append(itemVC2)
        pages.append(itemVC3)
        // 기본으로 나와야 할 화면이 어떤건지 설정함
        setViewControllers([itemVC1], direction: .forward, animated: true, completion: nil)
        // 연결을 해주어야함
        self.dataSource = self
    }
}

extension OnboardingPageViewController: UIPageViewControllerDataSource {
    // before
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        if currentIndex == 0 {
            return pages.last
        }
        else {
            return pages[currentIndex - 1]
        }
    }
    // after
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        if currentIndex == pages.count - 1 {
            return pages.first
        }
        else {
            return pages[currentIndex + 1]
        }
    }
    
    
}
