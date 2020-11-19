//
//  CountDownSingleViewController.swift
//  CellDownCountProject
//
//  Created by Mackun on 2020/11/17.
//  Copyright © 2020 Xcode. All rights reserved.
//

import UIKit

class CountDownSingleViewController: UIViewController {
    var dataSource = [CountDownModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        CountDownHelpManager.sharedManager.startCount()
        setupUI()
        getData()

        // Do any additional setup after loading the view.
    }
    
    private func getData() -> Void {
        for index in 0..<50 {
            let randomTimerCount = arc4random()%100
            let model = CountDownModel.init(title: "CountProject \(index)", count: Int(randomTimerCount))
            dataSource.append(model)
        }
        tableView.reloadData()
    }
    
    private func setupUI() -> Void {
        title = "CellDownProject"
        view.addSubview(tableView)
    }
    
    private lazy var tableView: UITableView = {
        let tb = UITableView.init(frame: view.frame)
        
        tb.backgroundColor = .gray
        tb.dataSource = self
        tb.delegate = self
    
        tb.register(CountDownCell.classForCoder(), forCellReuseIdentifier: CountDownCell.cellReuseIdentifier())
        return tb
    }()
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension CountDownSingleViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.dataSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CountDownCell.cellReuseIdentifier()) as! CountDownCell
        cell.model = model
        return cell
    }
    
    
}
