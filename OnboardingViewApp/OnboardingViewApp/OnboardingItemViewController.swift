//
//  OnboardingItemViewController.swift
//  OnboardingViewApp
//
//  Created by Kim TaeSoo on 2021/08/18.
//

import UIKit

class OnboardingItemViewController: UIViewController {
    var mainText = ""
    var subText = ""
    var topImage: UIImage? = UIImage() // 이미지는 값이 없을 수 있기 때문에 옵셔널로 함
    @IBOutlet private weak var topImageView: UIImageView!
    @IBOutlet private weak var mainTitleLabel: UILabel!{
        didSet {
            mainTitleLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        }
    }
    @IBOutlet private weak var descriptionLabel: UILabel!{
        didSet {
            descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTitleLabel.text = mainText
        descriptionLabel.text = subText
        topImageView.image = topImage
    }
}
