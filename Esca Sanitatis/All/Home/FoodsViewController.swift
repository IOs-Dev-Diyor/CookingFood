//
//  ViewController.swift
//  Food
//
//  Created by Diyorbek Xikmatullayev on 17/11/23.
import UIKit
import SnapKit
import SDWebImage
import SETabView

class FoodsViewController: UIViewController, SETabItemProvider {
    
    var seTabBarItem: UITabBarItem? {
        return UITabBarItem(title: "", image: UIImage(named: "restaurant"), tag: 0)
    }
    var myTitle = ""
    var foodArr = [Recipe]() {
        didSet {
            tableview.reloadData()
        }
    }
    let defaults = UserDefaults.standard
    var selArr = [String]()
    var isOn = false
    
    var calArr = ["recipes", "health", "inspiration", "budget", "baking"]
    var a = 0
    var tableview = UITableView()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "recipes"
        label.backgroundColor = UIColor(named: "backroundColor")
        label.textAlignment = .left
        label.layer.masksToBounds = true
        label.font = UIFont(name: "Avenir-Heavy", size: 28)
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodArr  = Recipe.loadJson(fileName: "recipes") ?? []
        view.backgroundColor = UIColor(named: "backroundColor")
        title = myTitle
        tableview.register(FoodsTableViewCell.self, forCellReuseIdentifier: FoodsTableViewCell.identifier)
        view.addSubview(tableview)
        view.addSubview(titleLabel)
        tableview.backgroundColor = UIColor(named: "backroundColor")
        tableview.separatorStyle = .none
        tableview.showsVerticalScrollIndicator = false
        tableview.delegate = self
        tableview.dataSource = self
        
       
    
        
        createdScroll(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableview.reloadData()
    }
    
    func createdScroll(_ work: Bool) {
        
        if work == true {
            let scrollView = UIScrollView()
            scrollView.backgroundColor = UIColor(named: "backroundColor")
            scrollView.isDirectionalLockEnabled = false
            scrollView.showsHorizontalScrollIndicator = false
           
            view.addSubview(scrollView)

            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = 15
            scrollView.addSubview(stackView)

            for i in 0...4 {
                let subview = createSubview(index: i)
                subview.layer.cornerRadius = 28
                stackView.addArrangedSubview(subview)
                subview.snp.makeConstraints { make in
                    make.width.equalTo(70)
                    make.height.equalTo(scrollView.frame.size.height/2)
                }
                a += 1
            }

            stackView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
                make.height.equalToSuperview()
            }

            scrollView.snp.makeConstraints { make in
                make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
                make.left.equalTo(20)
                make.right.equalTo(0)
                make.height.equalTo(100)
            }
        } else {
            print("empty")
        }
       
    }
    
    func createSubview(index: Int) -> UIView {
        let subview = UIView()
        subview.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)

        let imageView = UIImageView()
        imageView.contentMode = .center
        subview.addSubview(imageView)

        imageView.snp.makeConstraints { make in
            make.top.left.equalTo(5)
            make.right.equalTo(-5)
            make.height.equalTo(subview.snp.height).dividedBy(2)
        }

        let label = UILabel()
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.font = UIFont(name: "Avenir-Heavy", size: 14)
        label.numberOfLines = 0
        subview.addSubview(label)

        label.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.bottom.equalTo(0)
        }

        let button = UIButton()
        button.backgroundColor = .clear
        button.layer.cornerRadius = 28
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        subview.addSubview(button)

        button.snp.makeConstraints { make in
            make.edges.equalTo(subview)
        }
        
        if index < calArr.count {
            imageView.image = UIImage(named: calArr[index])
            label.text = calArr[index].capitalized
            button.tag = a
            
            } else {
                imageView.image = UIImage(named: "")
                label.text = ""
            }

        return subview
    }
    
    @objc func buttonPressed(sender: UIButton) {
      
        sender.backgroundColor = .gray.withAlphaComponent(0.3)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            UIView.animate(withDuration: 0.3) {
                sender.backgroundColor = .clear
            }
        }
        
        if sender.tag == 0 {
            print("zero")
            let food = Recipe.loadJson(fileName: "recipes")
           foodArr = food ?? []
            titleLabel.text = "recipes"
            tableview.reloadData()
        } else if sender.tag == 1 {
            print("one")
            let food = Recipe.loadJson(fileName: "health")
            titleLabel.text = "health"
           foodArr = food ?? []
            tableview.reloadData()
        } else if sender.tag == 2 {
            print("two")
            let food = Recipe.loadJson(fileName: "inspiration")
           foodArr = food ?? []
            titleLabel.text = "inspiration"
            tableview.reloadData()
        } else if sender.tag == 3 {
            print("three")
            let food = Recipe.loadJson(fileName: "budget")
           foodArr = food ?? []
            titleLabel.text = "budget"
            tableview.reloadData()
        } else if sender.tag == 4 {
            print("five")
            let food = Recipe.loadJson(fileName: "baking")
           foodArr = food ?? []
            titleLabel.text = "baking"
            tableview.reloadData()
        }

        print("Button Pressed!")
    }
    
    @objc func clearBtn(_ sender: UIButton) {
        
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(200)
            make.left.right.equalTo(0)
            make.bottom.equalTo(-10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(30)
            make.height.equalTo(45)
            make.width.equalTo(150)
            make.bottom.equalTo(tableview.snp.top).offset(-5)
        }
    }
    
    
}



extension FoodsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FoodsTableViewCell.identifier, for: indexPath) as! FoodsTableViewCell
        cell.backgroundColor = UIColor(named: "backroundColor")
        let obj = foodArr[indexPath.row]
        cell.configure(obj)
        
        cell.saveButton.tag = indexPath.row
        cell.saveButton.addTarget(self, action: #selector(likeTapped), for: .touchUpInside)

        let objId = foodArr[indexPath.row].id
        let saveIdArr = UserDefaults.standard.array(forKey: MyKeys.save) as? [String] ?? []
        if saveIdArr.contains(where: { str in str == objId }) {
            cell.saveButton.setImage(UIImage(named: "fullstorage"), for: .normal)
        } else {
            cell.saveButton.setImage(UIImage(named: "storage"), for: .normal)
        }
        
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
        vc.oneRecip = foodArr[index]
        
        vc.configure(obj)
    navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func likeTapped(_ sender: UIButton) {
        
        
        let objId = foodArr[sender.tag].id

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

struct MyKeys {
    
    static let save = "saveIdArr"
}
