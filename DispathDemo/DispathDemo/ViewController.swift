//
//  ViewController.swift
//  DispathDemo
//
//  Created by Mackun on 2021/1/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = DispatchManager.shared
        manager.addTask(name: "Task 1", level: .low)
        manager.addTask(name: "Task 2", level: .low)
        manager.addTask(name: "Task 3", level: .high)
        // Do any additional setup after loading the view.
    }


}

