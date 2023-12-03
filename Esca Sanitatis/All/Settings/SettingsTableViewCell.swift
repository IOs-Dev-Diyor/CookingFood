//
//  SettingsTableViewCell.swift
//  Food
//
//  Created by Diyorbek Xikmatullayev on 28/11/23.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    static let identifier = "SettingsTableViewCell"
    
    let settingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "backroundColor")
        view.layer.cornerRadius = 12
        return view
    }()
    
     let settingsImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
     var settingsText: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = UIColor(named: "otherColor")
        label.textAlignment = .left
        label.textColor = .black
        label.layer.masksToBounds = true
        label.font = UIFont(name: "Avenir-Heavy", size: 17)
        label.numberOfLines = 0
        return label
    }()
    
    let settingsIcon: UIImageView = {
       let image = UIImageView()
       image.contentMode = .scaleAspectFill
       image.layer.masksToBounds = true
       image.image = UIImage(named: "right")?.withRenderingMode(.alwaysTemplate)
       image.tintColor = UIColor(named: "otherColor")
       return image
   }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(settingView)
        settingView.addSubview(settingsImage)
        settingView.addSubview(settingsText)
        settingView.addSubview(settingsIcon)
        
        contentView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        settingView.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(65)
            make.bottom.equalTo(-5)
        }
        
        settingsImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(20)
            make.height.width.equalTo(40)
        }
        
        settingsText.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(settingsImage.snp.right).offset(20)
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
        
        settingsIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(-20)
            make.height.width.equalTo(30)
        }
    }
    
    public func configureText(_ obj: String) {
        settingsText.text = "\(obj)"
        settingsImage.image = UIImage(named: "\(obj)")?.withRenderingMode(.alwaysTemplate)
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

