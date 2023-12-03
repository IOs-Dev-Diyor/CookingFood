//
//  CustomView.swift
//  Food
//
//  Created by Diyorbek Xikmatullayev on 30/11/23.
//

import Foundation
import UIKit

class NavigationView: UIView {
    
    let title = UILabel()
    let leftItem = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "otherColor")
        
        title.font = .systemFont(ofSize: 22, weight: .bold)
        title.textColor = .systemYellow
        title.textAlignment = .center
        title.font = UIFont(name: "MarkerFelt-Wide", size: 20)
        
        leftItem.setImage(UIImage(named: "left")?.withRenderingMode(.alwaysTemplate), for: .normal)
        leftItem.tintColor = title.textColor
        leftItem.isHidden = true
 
        addSubview(title)
        addSubview(leftItem)
        
        title.snp.makeConstraints { make in
            make.bottom.equalTo(-10)
            make.left.equalTo(leftItem.snp.right).offset(5)
            make.right.equalTo(-35)
        }
        leftItem.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.centerY.equalTo(title.snp.centerY)
            make.height.width.equalTo(22)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
}

