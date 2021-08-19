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
    var bottomButtonMargin: NSLayoutConstraint? // 버튼에 저장된 margin값을 저장할 수 있음
    var pageControl = UIPageControl() // 밑에 ...을 의미함
    let startIndex = 0
    var currentIndex = 0 {
        didSet{
            pageControl.currentPage = currentIndex
        }
    }
    
    func makePageVC() {
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
        self.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.makePageVC()
        self.makeBottomButton()
        self.makePageControl()
    }
    
    func makeBottomButton() {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemBlue
        // 버튼의 이벤트 설정 addtarget으로 func연결 가능, 이벤트는 touchUpInside가 일반적임
        button.addTarget(self, action: #selector(dismissPageVC), for: .touchUpInside)
        // 화면에 버튼을 올리는 과정
        self.view.addSubview(button)
        // 오토레이아웃을 사용하기 위해서는 false로 설정을 해 주어야 함
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // 코드로 오토레이아웃 하는 방법
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        // constant에 값을 안줄거면(0으로 하려면) 없는걸로 해두됨
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        // 버튼이 마지막 페이지에서 보이게 하는 법
        bottomButtonMargin = button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0) // safe area 처리, constant 값이 올라가면 버튼이 내려감
        bottomButtonMargin?.isActive = true
        
        hideButton()
    }
    
    func makePageControl() {
        self.view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        // 현재 선택된 .의 색깔
        pageControl.currentPageIndicatorTintColor = .black
        // 선택 안된 .의 색깔
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = startIndex // current page가 움직일때마다 값을 받아야함
        pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -80).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        // .과 관련한 터치에 관련한 이벤트를 사용 할지 말지
        pageControl.isUserInteractionEnabled = true
        // 새로운 이벤트 생성
        pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
    }
    @objc func pageControlTapped(sender: UIPageControl) {
        if sender.currentPage > self.currentIndex{
        self.setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
        }
        else{
            self.setViewControllers([pages[sender.currentPage]], direction: .reverse, animated: true, completion: nil)
        }
        // currentIndex의 값을 가져와야함
        self.currentIndex = sender.currentPage
        buttonPresentationStyle()
    }
    @objc func dismissPageVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension OnboardingPageViewController: UIPageViewControllerDataSource {
    // before
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        self.currentIndex = currentIndex
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
        self.currentIndex = currentIndex
        if currentIndex == pages.count - 1 {
            return pages.first
        }
        else {
            return pages[currentIndex + 1]
        }
    }
    
    
}

// didFinishAnimating 화면이 움직이고 딱 멈춘 그 시점
extension OnboardingPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let currentVC = pageViewController.viewControllers?.first else {
            return
        }
        guard let currentIndex = pages.firstIndex(of: currentVC) else {
            return
        }
        self.currentIndex = currentIndex
        buttonPresentationStyle()
    }
    func buttonPresentationStyle() {
        if currentIndex == pages.count - 1 {
            // show button
            self.showButton()
        }
        else {
            // hide button
            self.hideButton()
        }
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
        /* 위 아래가 같은 의미를 가지는 코드임
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: [.curveEaseInOut], animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        */
    }
    func showButton() {
        bottomButtonMargin?.constant = 0
    }
    func hideButton() {
        bottomButtonMargin?.constant = 100
    }
    
}
