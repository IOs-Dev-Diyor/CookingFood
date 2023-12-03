//
//  TabBarVc.swift
//  Food
//
//  Created by Diyorbek Xikmatullayev on 22/11/23.
//

import UIKit
import SETabView


import UIKit
import SETabView

class TabBarVc: SETabViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTabColors(backgroundColor: .white, ballColor: .white, tintColor: .black, unselectedItemTintColor: .gray, barTintColor: .clear)
        
        setViewControllers(getViewControllers())
        
    }
    
    private func getViewControllers() -> [UIViewController] {
        
        return [
            FoodsViewController(),
            GameViewController(),
            SettingViewController(),
        ]
    }
}
