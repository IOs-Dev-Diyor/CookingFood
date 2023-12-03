
import UIKit
import SnapKit
import SDWebImage
import SETabView

import UIKit

class GameViewController: UIViewController, SETabItemProvider {
    var seTabBarItem: UITabBarItem? {
        return UITabBarItem(title: "search", image: UIImage(named: "game"), tag: 0)
    }
    
    let navigationView = NavigationView(frame: .zero)
    let tableView = UITableView()
    let bgImage = UIImageView()
    
    var oldTag = 0
    var isReload = false
    
    var allAnimals = [Recipe]()
    var gameLeftArr = [Recipe]()
    var gameRightArr = [Recipe]()
    var gameArr = [Recipe]() {
        didSet{
            self.isReload = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.tableView.reloadData()
                self.isReload = false
                if self.gameArr.isEmpty {
                    self.navigationView.title.text = "You Win!"
                    self.bgImage.isHidden = false
                    self.navigationView.leftItem.isHidden = false
                    self.bgImage.image = UIImage(named: "win")
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backroundColor")
        allAnimals = Recipe.loadJson(fileName: "baking") ?? []
        
        startGame()
        
        navigationView.title.numberOfLines = 2
        navigationView.leftItem.isHidden = false
        navigationView.backgroundColor = .clear
        navigationView.title.font = .systemFont(ofSize: 18, weight: .semibold)
        navigationView.leftItem.addTarget(self, action: #selector(restart), for: .touchUpInside)
        navigationView.leftItem.setImage(UIImage(named: "restart")?.withRenderingMode(.alwaysTemplate), for: .normal)
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(GameCell.self, forCellReuseIdentifier: "GameCell")
        view.addSubview(bgImage)
        view.addSubview(navigationView)
        view.addSubview(tableView)
        
        bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        navigationView.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide).offset(65)
            make.left.right.top.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navigationView.snp.bottom).offset(0)
            make.left.right.bottom.equalToSuperview()
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}

extension GameViewController {
    
    @objc func restart() {
        startGame()
    }
    
    func startGame() {
        let num = 4
        let arr = allAnimals.shuffled()
        var anArr = [Recipe]()
        for i in 0..<num {
            anArr.append(arr[i])
        }
        gameArr = anArr
        gameLeftArr = gameArr.shuffled()
        gameRightArr = gameArr.shuffled()
        oldTag = 0
        isReload = false
        bgImage.isHidden = true
        navigationView.leftItem.isHidden = true
        navigationView.title.text = "find the correct picture and name of the foods!"
    }


    func arrShufled() {
        gameLeftArr = gameArr.shuffled()
        gameRightArr = gameArr.shuffled()
    }
    
    @objc func itemClicked (_ sender: UIButton) {
        if isReload == false {
            let btn = sender as! ButtonWithCheck
            if oldTag/100 == 1 {  //Left
                if sender.tag/100 == 2 {  // Right
                    let rW = gameLeftArr[oldTag-100].name
                    let lW = gameRightArr[sender.tag-200].name
                    isEqual(btn, rW, lW)
                }
            } else if oldTag/100 == 2 {   // Right
                if sender.tag/100 == 1 {  //Left
                    let rW = gameRightArr[oldTag-200].name
                    let lW = gameLeftArr[sender.tag-100].name
                    isEqual(btn, rW, lW)
                }
            } else {
                btn.layer.borderColor = UIColor.green.cgColor
                btn.check.isHidden = false
                oldTag = btn.tag
            }
        }
    }

    func isEqual(_ btn: ButtonWithCheck,_ rW: String?,_ lW: String?){
        if rW == lW {
            gameArr = gameArr.filter { $0.name != rW}
            gameLeftArr = gameLeftArr.filter { $0.name != rW }
            gameRightArr = gameRightArr.filter { $0.name != rW }
            oldTag = 0
            btn.layer.borderColor = UIColor.green.cgColor
        } else {
            elseFunc(btn)
        }
        btn.check.isHidden = false
    }
    
    func elseFunc (_ btn: ButtonWithCheck) {
        btn.check.tintColor = .red
        btn.check.image = UIImage(named: "cancel")?.withRenderingMode(.alwaysTemplate)
        btn.layer.borderColor = UIColor.red.cgColor
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            UIView.animate(withDuration: 0) {
                btn.layer.borderColor = UIColor.systemOrange.cgColor
                btn.check.isHidden = true
                btn.check.tintColor = .green
                btn.check.image = UIImage(named: "check")?.withRenderingMode(.alwaysTemplate)
            }
        }
    }
   
    
   
}

extension GameViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell") as! GameCell
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        guard indexPath.row < gameLeftArr.count, indexPath.row < gameRightArr.count else {
               // Handle the case where the index is out of bounds
               print("Index out of range error in cellForRowAt. Check the arrays and indices.")
               return cell
           }
        cell.initDatas(l: gameLeftArr[indexPath.row], r: gameRightArr[indexPath.row])

        cell.leftItem.tag = 100 + indexPath.row
        cell.rightItem.tag = 200 + indexPath.row
        cell.leftItem.addTarget(self, action: #selector(itemClicked), for: .touchUpInside)
        cell.rightItem.addTarget(self, action: #selector(itemClicked), for: .touchUpInside)


        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }
}

