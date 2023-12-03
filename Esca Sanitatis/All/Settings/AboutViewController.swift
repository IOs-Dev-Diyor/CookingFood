//
//  AboutViewController.swift
//  Food
//
//  Created by Diyorbek Xikmatullayev on 29/11/23.
//

import UIKit
import SnapKit
import SETabView

class AboutViewController: UIViewController, SETabItemProvider {
    var seTabBarItem: UITabBarItem? {
        return UITabBarItem(title: "search", image: UIImage(named: "search"), tag: 3)
    }
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor(named: "backroundColor")
        textView.textColor = UIColor(named: "otherColor")
        textView.showsVerticalScrollIndicator = false
        textView.font = UIFont(name: "Avenir-Heavy", size: 20)
        textView.layer.cornerRadius = 8
        textView.isEditable = false
        textView.isSelectable = false
        textView.textContainerInset = UIEdgeInsets(top: 220, left: 10, bottom: 3.5, right: 10)
        return textView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "about")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backroundColor")
        title = "About App"
        view.addSubview(textView)
        textView.addSubview(imageView)
        
        textView.text = """
        The cooking app for kids is objective and convenient, introducing you to a collection of your favorite dishes, instructions, recipes and today's descriptions. It's an app designed to search for different cuisines, explore new fares, and get related questions and answers. A few useful aspects:
        1. Recipes and Recipes: There are many recipes, recipes and recipes in this kind of apps. This will expand your options and allow you to learn new dishes.
        2. Questions and Answers First: If you have any questions about cooking, you can often find answers to your questions through this app. This can be helpful as your friends and family can give you advice on cooking.
        3. Public review: Some homes may have a public review of the "cooking app" that introduces food achievements and opinions. It helps to know the opinions of people who are close to you.
        At the app selection level, you can check out several apps to see what kind of meals, fares, and amenities you need.
        """
        
        let leftBarButton = UIBarButtonItem(image: UIImage(named: "back"), style: .done, target: self, action: #selector(noneLeft))
        leftBarButton.tintColor = UIColor(named: "otherColor")
        navigationItem.leftBarButtonItem = leftBarButton
    }
    
    @objc func noneLeft() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        textView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(-20)
        }
        
       
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(0)
            make.height.equalTo(200)
            make.width.equalTo(300)
        }
        
    }
}
