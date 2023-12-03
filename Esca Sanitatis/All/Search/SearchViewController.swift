

import UIKit
import SnapKit
import SDWebImage
import SETabView

class SearchViewController: UIViewController, SETabItemProvider {
    
    var seTabBarItem: UITabBarItem? {
        return UITabBarItem(title: "search", image: UIImage(named: "search"), tag: 3)
    }
    
    var calArr = ["recipes", "health", "inspiration", "budget", "baking"]
    var filteredFoodArr = [Recipe]()
    lazy  var foodArr = filteredFoodArr
    var a = 0

    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(named: "backroundColor")
        label.text = "recipes"
        label.textColor = UIColor(named: "otherColor")
        label.textAlignment = .left
        label.layer.masksToBounds = true
        label.font = UIFont(name: "Avenir-Heavy", size: 28)
        label.numberOfLines = 0
        return label
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .default
        searchBar.sizeToFit()
        searchBar.isTranslucent = true
        searchBar.endEditing(true)
        if #available(iOS 13.0, *) {
            searchBar.searchTextField.backgroundColor = UIColor(named: "backroundColor")
            searchBar.searchTextField.textColor =  UIColor(named: "otherColor")
        } else {
            // Fallback on earlier versions
        }
        searchBar.placeholder = " write food name"
        searchBar.layer.borderWidth = 1
        searchBar.layer.cornerRadius = 8
    return searchBar
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backroundColor")
        title = "Search"
        tableView.register(FoodsTableViewCell.self, forCellReuseIdentifier: FoodsTableViewCell.identifier)
        view.addSubview(tableView)
        view.addSubview(titleLabel)
        view.addSubview(searchBar)
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self

        filteredFoodArr = Recipe.loadJson(fileName: "recipes") ?? []
        
        filterButton()
       
        let leftBarButton = UIBarButtonItem(image: UIImage(named: "back"), style: .done, target: self, action: #selector(noneLeft))
        leftBarButton.tintColor = UIColor(named: "otherColor")
        navigationItem.leftBarButtonItem = leftBarButton
    }
    
    @objc func noneLeft() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func filterButton() {
        for i in 0...4 {
            let wd = UIScreen.main.bounds.width
            let mg: CGFloat = 15
            let x = (wd - 6*mg)/5
            let button = UIButton()
            button.tag = a
            button.frame = CGRect(x: CGFloat(i)*(x + mg) + mg, y: view.frame.size.width/2.4 , width: x, height: x)
        
            switch i {
            case 0:
                button.setTitle("recipes", for: .normal)
            case 1:
                button.setTitle("health", for: .normal)
            case 2:
                button.setTitle("inspir", for: .normal)
            case 3:
                button.setTitle("budget", for: .normal)
            case 4:
                button.setTitle("baking", for: .normal)
            default:
                button.setTitle("impty", for: .normal)
             
            }
            button.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 14)
            button.layer.cornerRadius = x/2
            button.setTitleColor(UIColor(named: "otherColor"), for: .normal)
            button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            view.addSubview(button)
            a += 1
        }
    }
    
    @objc func buttonPressed(sender: UIButton) {
      
        sender.backgroundColor = .gray.withAlphaComponent(0.3)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            UIView.animate(withDuration: 0.3) {
                sender.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            }
        }
        
        if sender.tag == 0 {
            print("zero")
            filteredFoodArr = Recipe.loadJson(fileName: "recipes") ?? []
           foodArr = filteredFoodArr
            titleLabel.text = "recipes"
            tableView.reloadData()
        } else if sender.tag == 1 {
            print("one")
            filteredFoodArr = Recipe.loadJson(fileName: "health") ?? []
            titleLabel.text = "health"
           foodArr = filteredFoodArr
            tableView.reloadData()
        } else if sender.tag == 2 {
            print("two")
            filteredFoodArr = Recipe.loadJson(fileName: "inspiration") ?? []
           foodArr = filteredFoodArr
            titleLabel.text = "inspiration"
            tableView.reloadData()
        } else if sender.tag == 3 {
            print("three")
            filteredFoodArr = Recipe.loadJson(fileName: "budget") ?? []
           foodArr = filteredFoodArr
            titleLabel.text = "budget"
            tableView.reloadData()
        } else if sender.tag == 4 {
            print("five")
            filteredFoodArr = Recipe.loadJson(fileName: "baking") ?? []
           foodArr = filteredFoodArr
            titleLabel.text = "baking"
            tableView.reloadData()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(210)
            make.left.right.equalTo(0)
            make.bottom.equalTo(-10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(30)
            make.height.equalTo(45)
            make.width.equalTo(150)
            make.bottom.equalTo(tableView.snp.top).offset(-5)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(45)
        }

    }

}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        foodArr = filteredFoodArr.filter({
            $0.name.range(of: searchText, options: .caseInsensitive) != nil
        })
        if foodArr.isEmpty && searchText.isEmpty { foodArr = filteredFoodArr }
        tableView.reloadData()
        print(searchText)
    }
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return foodArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FoodsTableViewCell.identifier, for: indexPath) as! FoodsTableViewCell

        let obj = foodArr[indexPath.row]
        cell.backgroundColor = UIColor(named: "backroundColor")
        cell.configure(obj)
        cell.selectionStyle = .none

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.width - 20
        }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        didtapCell(indexPath.row)
    }

    func didtapCell(_ index: Int) {
        let vc = FoodsAboutViewController()
        let obj = foodArr[index]
        vc.configure(obj)
    navigationController?.pushViewController(vc, animated: true)
    }

}


