//
//  FoodsCollectionViewCell.swift
//  Food
//
//  Created by Diyorbek Xikmatullayev on 19/11/23.
//

import UIKit

class FoodsTableViewCell: UITableViewCell {
    static let identifier = "FoodsTableViewCell"
    
    let barView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "backroundColor")?.withAlphaComponent(0.5)
        view.clipsToBounds = true
        return view
    }()
    
    let foodImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.image = UIImage(named: "placeholder")
        image.layer.cornerRadius = 16
        return image
    }()
    
    
    let foodName: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor(named: "otherColor")
        label.numberOfLines = .zero
        label.font = UIFont(name: "Avenir-Heavy", size: 18)
        return label
    }()
    
    let rattingView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        view.layer.cornerRadius = 8
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
    
    let timeView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = UIColor(named: "backroundColor")?.withAlphaComponent(0.5)
        view.layer.cornerRadius = 12
        return view
    }()
    
    let timeIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.image = UIImage(named: "time")
        return image
    }()
    
    let timeCookinglabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor(named: "otherColor")
        label.numberOfLines = .zero
        label.font = UIFont(name: "GillSans-Bold", size: 15)
        return label
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
        view.layer.cornerRadius = 30
        return view
    }()
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFill
        button.clipsToBounds = true
        button.layer.masksToBounds = true
        button.setImage(UIImage(named: "storage"), for: .normal)
        return button
    }()
    
    

    

    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(foodImage)
        foodImage.addSubview(barView)
        barView.addSubview(foodName)
        barView.addSubview(rattingView)
        rattingView.addSubview(rattingLabel)
        rattingView.addSubview(rattingIcon)
        foodImage.addSubview(timeView)
        timeView.addSubview(timeIcon)
        timeView.addSubview(timeCookinglabel)
        contentView.addSubview(saveView)
        contentView.addSubview(saveButton)
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        foodImage.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.left.equalTo(20)
            make.right.equalTo(-10)
            make.height.equalTo(foodImage.snp.width)
            make.bottom.equalTo(-10)
        }
        
        barView.snp.makeConstraints { make in
            make.left.right.equalTo(0)
            make.bottom.equalTo(0)
            make.height.equalTo(80)
        }
        
        foodName.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.left.equalTo(15)
            make.bottom.equalTo(-5)
            make.width.equalTo(200)
        }
        
        timeView.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.left.equalTo(20)
            make.height.equalTo(40)
            make.width.equalTo(120)
        }
        
        timeIcon.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.left.equalTo(5)
            make.bottom.equalTo(-5)
            make.width.equalTo(timeIcon.snp.height)
        }
        
        timeCookinglabel.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.left.equalTo(timeIcon.snp.right).offset(5)
            make.right.equalTo(-5)
            make.bottom.equalTo(-5)
        }
        
        rattingView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(-30)
            make.height.equalTo(30)
            make.width.equalTo(60)
        }
        
        rattingIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(8)
            make.bottom.equalTo(-5)
            make.width.equalTo(rattingIcon.snp.height)
        }
        
        rattingLabel.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.left.equalTo(rattingIcon.snp.right).offset(5)
            make.right.equalTo(-5)
            make.bottom.equalTo(-5)
        }
        
        saveView.snp.makeConstraints { make in
            make.top.equalTo(foodImage.snp.top)
            make.right.equalTo(foodImage.snp.right)
            make.width.height.equalTo(60)
            saveView.layer.cornerRadius = foodImage.layer.cornerRadius
        }
        
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(foodImage.snp.top).offset(15)
            make.right.equalTo(foodImage.snp.right).offset(-15)
            make.height.width.equalTo(30)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ obj: Recipe) {
        foodImage.sd_setImage(with: URL(string: obj.image), placeholderImage: UIImage(named: "placeholder"))
        foodName.text = obj.name
        let maxChars = 7
        let cookingTime = obj.times.cooking ?? "30 mins"
        let truncatedCookingTime = String(cookingTime.prefix(maxChars))
        timeCookinglabel.text = truncatedCookingTime
       rattingLabel.text = "\(obj.rattings)"
    }
}
