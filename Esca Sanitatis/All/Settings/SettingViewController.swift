//
//  SittengViewController.swift
//  Food
//
//  Created by Diyorbek Xikmatullayev on 28/11/23.
//

import UIKit
import SETabView

class SettingViewController: UIViewController, SETabItemProvider {

    var seTabBarItem: UITabBarItem? {
        return UITabBarItem(title: "search", image: UIImage(named: "menu"), tag: 0)
    }
    
    var soupsArray = [Recipe]()
    var settingCellsArr = ["search", "saved ones", "about app", "share", "rate app", "quit app"]
    
    private let segmentedControl: UISegmentedControl = {
        let items = ["Device", "Light", "Dark"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
         segmentedControl.tintColor = .blue
        return segmentedControl
    }()
    
    private let modeView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        view.layer.cornerRadius = 14
        return view
    }()
    
    private let modeImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.image = UIImage(named: "mode")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = UIColor(named: "otherColor")
        return image
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.layer.cornerRadius = 14
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backroundColor")
        view.addSubview(modeView)
        modeView.addSubview(modeImage)
        modeView.addSubview(segmentedControl)
        view.addSubview(tableView)
        
        
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        segmentedControl.selectedSegmentIndex = MTUserDefaults.shared.theme.rawValue
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        
    }
    
    @objc func segmentedControlValueChanged() {
        MTUserDefaults.shared.theme = Theme(rawValue: segmentedControl.selectedSegmentIndex) ?? .device
        if #available(iOS 13.0, *) {
            view.window?.overrideUserInterfaceStyle = MTUserDefaults.shared.theme.getUserInterfaceStyle()
        } else {
            // Fallback on earlier versions
        }
//        tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        modeView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(100)
        }
        
        modeImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(20)
            make.width.height.equalTo(60)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(modeView.snp.bottom).offset(20)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-30)
        }
        
        segmentedControl.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(modeImage.snp.right).offset(20)
            make.right.equalTo(-20)
            make.height.equalTo(50)
        }
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingCellsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as! SettingsTableViewCell
        let obj = settingCellsArr[indexPath.row]
        cell.settingsText.textColor = UIColor(named: "otherColor")
        cell.settingsImage.tintColor = UIColor(named: "otherColor")
        cell.configureText(obj)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.width/4.8
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            let vc = SearchViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let selArr = UserDefaults.standard.array(forKey: "selArr") as? [String] ?? []
            
            let vc = FavoriteViewController()
           
                        vc.myTitle = "Selecteds"
//                        vc.foodArr = soupsArray.filter { obj in selArr.contains(obj.name) }
//            vc.createdScroll(false)
                            navigationController?.pushViewController(vc, animated: true)
        case 2:
           let vc = AboutViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            shareClicked()
        case 4:
            rateApp()
        case 5:
            quitClicked()
        default:
            print("not fount")
        }
    }
    
    func rateApp()->Void{
            let url = URL(string: "https://apps.apple.com/app/apple-store")!
            UIApplication.shared.open(url)
        }
    
    func shareClicked(){
            let vc = UIActivityViewController(activityItems: ["https://apps.apple.com"], applicationActivities: nil)
            vc.popoverPresentationController?.sourceView = self.view
            self.present(vc, animated: true, completion: nil)
        }
    
    func quitClicked(){
            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                exit(EXIT_SUCCESS)
            })
        }
    
    
}


