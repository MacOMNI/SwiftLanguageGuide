//
//  ViewController.swift
//  CountDownManager
//
//  Created by Mackun on 2020/11/23.
//

import UIKit
extension UITableViewCell {
    static func reuseIdentifier() -> String {
        return String(describing: self)
    }
}
class ViewController: UIViewController {

    private var dataSoure = [CountDownModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setup()
        getData()
        // Do any additional setup after loading the view.
    }
    
    func setup() -> Void {
        view.addSubview(tableView)
    }
    
    func getData() -> Void {
        
        for index in 0..<40 {
            let model = CountDownModel.init(title: String(format: "Count Project %d", index + 1), lastTime: Int(arc4random())%100, startTime: Int(Date.init().timeIntervalSince1970))
            dataSoure.append(model)
        }
        
        tableView.reloadData()
    }

    private lazy var tableView: UITableView = {
        let tb = UITableView.init(frame: view.frame)
        tb.delegate = self
        tb.dataSource = self
        tb.register(CountDownCell.classForCoder(), forCellReuseIdentifier: CountDownCell.reuseIdentifier())
        return tb
    }()
    
    

}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSoure.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountDownCell.reuseIdentifier(), for: indexPath) as! CountDownCell
//        let cell = tableView.dequeueReusableCell(withIdentifier: CountDownCell.reuseIdentifier()) as! CountDownCell
        cell.model = dataSoure[indexPath.row]
        
        return cell
    }
    
    
}
