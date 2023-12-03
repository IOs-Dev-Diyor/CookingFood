//
//  GameTableViewCell.swift
//  Food
//
//  Created by Diyorbek Xikmatullayev on 30/11/23.
//

import Foundation
import UIKit

class GameCell: UITableViewCell {
    
    let leftItem = ButtonWithCheck()
    let rightItem = ButtonWithCheck()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        
        leftItem.clipsToBounds = true
        leftItem.contentMode = .scaleAspectFill
        leftItem.backgroundColor = .systemYellow
        
        leftItem.layer.borderColor = UIColor.systemOrange.cgColor
        leftItem.layer.borderWidth = 3
        leftItem.layer.cornerRadius = 85
        
        rightItem.clipsToBounds = true
        rightItem.contentMode = .scaleAspectFill
        rightItem.backgroundColor = .systemYellow
        
        rightItem.layer.borderColor = UIColor.systemOrange.cgColor
        rightItem.layer.borderWidth = 3
        
        contentView.addSubview(leftItem)
        contentView.addSubview(rightItem)
        leftItem.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.right.equalTo(contentView.snp.centerX).offset(-10)
            make.height.equalTo(leftItem.snp.width)
            make.bottom.equalTo(-10)
        }
        rightItem.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(-10)
            make.left.equalTo(contentView.snp.centerX).offset(10)
            make.height.equalTo(leftItem.snp.width)
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        rightItem.layer.cornerRadius = 85
        leftItem.layer.cornerRadius = 85
    }
    
    func initDatas(l: Recipe, r: Recipe){
        
        leftItem.title.text =  l.name
        leftItem.image.sd_setImage(with: URL(string: l.image), placeholderImage: UIImage(named: "placeholder"))

        rightItem.title.text =  r.name
        rightItem.image.sd_setImage(with: URL(string: r.image ), placeholderImage: UIImage(named: "placeholder"))
        
        rightItem.title.isHidden = true
        rightItem.image.isHidden = false
        leftItem.title.isHidden = false
        leftItem.image.isHidden = true
        leftItem.layer.cornerRadius = leftItem.frame.size.height/2
        
        leftItem.check.isHidden = true
        rightItem.check.isHidden = true
        leftItem.layer.borderColor = UIColor.systemOrange.cgColor
        rightItem.layer.borderColor = UIColor.systemOrange.cgColor
        rightItem.layer.cornerRadius = rightItem.frame.size.height/2
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
