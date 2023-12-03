//
//  FoodsAboutViewController.swift
//  Food
//
//  Created by Diyorbek Xikmatullayev on 20/11/23.
//

import UIKit

class FoodsAboutViewController: UIViewController {
    
    var oneRecip: Recipe?
    
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        return table
    }()
    
    let scrollView: UIScrollView = {
            let scrollView = UIScrollView()
        scrollView.isDirectionalLockEnabled = false
            scrollView.backgroundColor  = UIColor(named: "backroundColor")
        scrollView.showsVerticalScrollIndicator = false
            return scrollView
        }()
    
    let contentView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor(named: "backroundColor")
            return view
        }()

    let foodImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.image = UIImage(named: "placeholder")
        image.layer.cornerRadius = 40
        image.layer.maskedCorners = [.layerMinXMaxYCorner]
        return image
    }()
    
    let foodName: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor(named: "otherColor")
        label.numberOfLines = .zero
        label.font = UIFont(name: "Avenir-Heavy", size: 23)
        return label
    }()
    
    let rattingView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        view.layer.cornerRadius = 20
        return view
    }()
    
    let rattingIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.image = UIImage(named: "star")
        return image
    }()
    
    let rattingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor(named: "otherColor")
        label.numberOfLines = .zero
        label.font = UIFont(name: "MarkerFelt-Wide", size: 18)
        return label
    }()
        
    let storageImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.image = UIImage(named: "storage")
        return image
    }()
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        view.layer.cornerRadius = 30
        return view
    }()
    
    let saveView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFill
        button.layer.masksToBounds = true
        button.setImage(UIImage(named: "storage"), for: .normal)
        button.addTarget(self, action: #selector(go), for: .touchUpInside)
        return button
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFill
        button.layer.masksToBounds = true
        button.setImage(UIImage(named: "back"), for: .normal)
        return button
    }()
    
    let ingredients: UILabel = {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        return label
    }()
    
    let timeIcon: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFill
        icon.layer.masksToBounds = true
        icon.image = UIImage(named: "time")
        return icon
    }()
    
    let servesIcon: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFill
        icon.layer.masksToBounds = true
        icon.image = UIImage(named: "serves")
        return icon
    }()
    
    let difficultIcon: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFill
        icon.layer.masksToBounds = true
        icon.image = UIImage(named: "difficult")
        return icon
    }()
    
    let maincategoryIcon: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFill
        icon.layer.masksToBounds = true
        icon.image = UIImage(named: "maincategory")
        return icon
    }()
    
    let timeCookinglabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(named: "otherColor")
        label.numberOfLines = .zero
        label.font = UIFont(name: "GillSans-Bold", size: 15)
        return label
    }()
    
    let servesLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(named: "otherColor")
        label.numberOfLines = .zero
        label.font = UIFont(name: "GillSans-Bold", size: 15)
        return label
    }()
    
    let difficultLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(named: "otherColor")
        label.numberOfLines = .zero
        label.font = UIFont(name: "GillSans-Bold", size: 15)
        return label
    }()
    
    let maincategoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(named: "otherColor")
        label.numberOfLines = .zero
        label.font = UIFont(name: "GillSans-Bold", size: 15)
        return label
    }()
    
    let ingredientsLbl: UILabel = {
        let label = UILabel()
        label.text = "ingredients"
        label.textColor = UIColor(named: "otherColor")
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(name: "GillSans-Bold", size: 20)
        return label
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.textColor = UIColor(named: "otherColor")
        textView.showsVerticalScrollIndicator = false
        textView.font = UIFont(name: "Avenir-Heavy", size: 16)
        textView.layer.cornerRadius = 8
            textView.isEditable = false
            textView.isSelectable = false
            textView.textContainerInset = UIEdgeInsets(top: 20, left: 20, bottom: 3.5, right: 0)
            return textView
        }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backroundColor")
        title = "About"
//        oneRecip  = Recipe.loadJson(fileName: "recipes") ?? []
       
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(foodName)
        contentView.addSubview(foodImage)
        contentView.addSubview(rattingView)
        rattingView.addSubview(rattingLabel)
        rattingView.addSubview(rattingIcon)
        foodImage.addSubview(backView)
        contentView.addSubview(backButton)
        contentView.addSubview(saveView)
        contentView.addSubview(saveButton)
        contentView.addSubview(textView)
        contentView.addSubview(tableView)
        contentView.addSubview(ingredientsLbl)
      
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        infoViews()

        let leftBarButton = UIBarButtonItem(image: UIImage(named: "back"), style: .done, target: self, action: #selector(noneLeft))
        leftBarButton.tintColor = UIColor(named: "otherColor")
        navigationItem.leftBarButtonItem = leftBarButton
        
        textView.snp.makeConstraints { make in
            make.top.equalTo(view.frame.size.height*0.75)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(-20)
            
        }
        
    }
  
    @objc func noneLeft() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func infoViews() {
        for i in 0...3 {
            let wd = UIScreen.main.bounds.width
            let mg: CGFloat = 20
            let viewframe = (wd - 5*mg)/4
 
            let infoView = UIView()
            

            infoView.frame = CGRect(x: CGFloat(i)*(viewframe + mg) + mg, y: view.frame.size.height/1.8, width: viewframe , height: viewframe + 40)
            infoView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            infoView.layer.cornerRadius = 25
            
            contentView.addSubview(infoView)
            
            if i == 0 {
                infoView.addSubview(timeIcon)
                infoView.addSubview(timeCookinglabel)
                
                timeIcon.snp.makeConstraints { make in
                    make.top.equalTo(20)
                    make.left.equalTo(20)
                    make.right.equalTo(-20)
                    make.height.equalTo(timeIcon.snp.width)
                }
                
                timeCookinglabel.snp.makeConstraints { make in
                    make.top.equalTo(timeIcon.snp.bottom).offset(5)
                    make.left.equalTo(10)
                    make.right.equalTo(-10)
                    make.bottom.equalTo(-10)
                }
                
            } else if i == 1 {
                infoView.addSubview(servesIcon)
                infoView.addSubview(servesLabel)
                
                servesIcon.snp.makeConstraints { make in
                    make.top.equalTo(20)
                    make.left.equalTo(20)
                    make.right.equalTo(-20)
                    make.height.equalTo(servesIcon.snp.width)
                }
                
                servesLabel.snp.makeConstraints { make in
                    make.top.equalTo(servesIcon.snp.bottom).offset(5)
                    make.left.equalTo(10)
                    make.right.equalTo(-10)
                    make.bottom.equalTo(-10)
                }
                
            } else if i == 2 {
                infoView.addSubview(difficultIcon)
                infoView.addSubview(difficultLabel)
                
                difficultIcon.snp.makeConstraints { make in
                    make.top.equalTo(20)
                    make.left.equalTo(20)
                    make.right.equalTo(-20)
                    make.height.equalTo(difficultIcon.snp.width)
                }
                
                difficultLabel.snp.makeConstraints { make in
                    make.top.equalTo(difficultIcon.snp.bottom).offset(5)
                    make.left.equalTo(10)
                    make.right.equalTo(-10)
                    make.bottom.equalTo(-10)
                }
                
            } else if i == 3 {
                infoView.addSubview(maincategoryIcon)
                infoView.addSubview(maincategoryLabel)
                maincategoryIcon.snp.makeConstraints { make in
                    make.top.equalTo(20)
                    make.left.equalTo(20)
                    make.right.equalTo(-20)
                    make.height.equalTo(maincategoryIcon.snp.width)
                }
                
                maincategoryLabel.snp.makeConstraints { make in
                    make.top.equalTo(maincategoryIcon.snp.bottom).offset(5)
                    make.left.equalTo(10)
                    make.right.equalTo(-10)
                    make.bottom.equalTo(-10)
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let objId = oneRecip?.id ?? ""

        let saveIdArr = UserDefaults.standard.array(forKey: MyKeys.save) as? [String] ?? []
        if saveIdArr.contains(where: { str in str == objId }) {
            saveButton.setImage(UIImage(named: "fullstorage"), for: .normal)
        } else {
            saveButton.setImage(UIImage(named: "storage"), for: .normal)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(900)
        }
        
        foodImage.snp.makeConstraints { make in
            make.left.right.top.equalTo(0)
            make.height.equalTo(view.frame.size.height/2.4)
        }
        
        foodName.snp.makeConstraints { make in
            make.top.equalTo(foodImage.snp.bottom).offset(25)
            make.left.equalTo(20)
            make.width.equalTo(Int(view.frame.size.width*2/3))
        }
        
        rattingView.snp.makeConstraints { make in
            make.top.equalTo(foodImage.snp.bottom).offset(30)
            make.right.equalTo(-30)
            make.height.equalTo(40)
            make.width.equalTo(80)
        }
        
        rattingIcon.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.left.equalTo(15)
            make.bottom.equalTo(-10)
            make.width.equalTo(rattingIcon.snp.height)
        }
        
        rattingLabel.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.left.equalTo(rattingIcon.snp.right).offset(15)
//            make.right.equalTo(-15)
            make.bottom.equalTo(-5)
        }
        
        backView.snp.makeConstraints { make in
//            make.top.equalTo(55)
//            make.left.equalTo(25)
//            make.width.height.equalTo(60)
        }
        
        saveView.snp.makeConstraints { make in
            make.top.equalTo(foodImage.snp.top).offset(15)
            make.right.equalTo(-20)
            make.width.height.equalTo(60)
        }
        
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(foodImage.snp.top).offset(30)
            make.right.equalTo(-35)
            make.width.height.equalTo(30)
        }
        
        
        ingredientsLbl.snp.makeConstraints { make in
            make.top.equalTo(timeCookinglabel.snp.bottom).offset(20)
            make.left.equalTo(25)
            make.width.equalTo(view.frame.size.width/2)
            make.height.equalTo(40)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(textView.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(-10)
        }
    }
    
    func configure(_ obj: Recipe) {
        let maxChars = 7
        let cookingTime = obj.times.cooking ?? "30 mins"
        let truncatedCookingTime = String(cookingTime.prefix(maxChars))
        timeCookinglabel.text = truncatedCookingTime
        servesLabel.text = "\(obj.serves)"
        difficultLabel.text = obj.difficult
        maincategoryLabel.text = obj.maincategory
        foodName.text = obj.name
        foodImage.sd_setImage(with: URL(string: obj.image), placeholderImage: UIImage(named: "placeholder"))
        rattingLabel.text = "\(obj.rattings)"
        for ingredient in obj.ingredients {
            textView.text.append(" • \(ingredient)\n")
        }

    }
    

    @objc func go(_ sender: UIButton){
        let objId = oneRecip?.id ?? ""

        var saveIdArr = UserDefaults.standard.array(forKey: MyKeys.save) as? [String] ?? []
        if saveIdArr.contains(where: { str in str == objId }) {
            saveIdArr = saveIdArr.filter { str in str != objId }
            sender.setImage(UIImage(named: "storage"), for: .normal)
        } else {
            saveIdArr.append(objId)
            sender.setImage(UIImage(named: "fullstorage"), for: .normal)
        }
        UserDefaults.standard.set(saveIdArr, forKey: MyKeys.save)
    }
}

