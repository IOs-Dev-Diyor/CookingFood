//
//  CustomButton.swift
//  Food
//
//  Created by Diyorbek Xikmatullayev on 30/11/23.
//

import Foundation
import UIKit

class ButtonWithCheck: UIButton {
    
    let title = UILabel()
    let image = UIImageView()
    let check = UIImageView()
    
    let size: CGFloat = 30
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        title.text = "More"
        title.textAlignment = .center
        title.font = .systemFont(ofSize: 16, weight: .semibold)
        title.textColor = .red
        title.numberOfLines = 0
        
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "placeholder")
        
        check.clipsToBounds = true
        check.contentMode = .scaleAspectFill
        check.tintColor = .green
        check.image = UIImage(named: "check")?.withRenderingMode(.alwaysTemplate)
        check.layer.cornerRadius = size/2
        check.backgroundColor = .black.withAlphaComponent(0.4)
        check.isHidden = true
        
        
        addSubview(image)
        addSubview(title)
        addSubview(check)
        
        title.snp.makeConstraints { make in
            make.top.left.equalTo(10)
            make.bottom.right.equalTo(-10)
        }
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        check.snp.makeConstraints { make in
            make.top.equalTo(10)
//            make.right.equalTo(-30)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(size)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
