//
//  DispatchManager.swift
//  DispathDemo
//
//  Created by Mackun on 2021/1/14.
//

import UIKit

enum Priority {
    case low
    case high
}

enum Status {
    case unstarted
    case running
    case finished
}

class Task {
    var name: String?
    var level: Priority
    var status: Status
    init(name: String, level : Priority) {
        self.name = name
        self.level = level
        self.status = .unstarted
    }
}

class DispatchManager {
   // static
    static let shared = DispatchManager()
    private var tasks:[Task]
    
    init() {
        tasks = [Task]()
        
    }
    
    func addTask(name: String, level: Priority) -> Void {
        
        let task = Task.init(name: name, level: level)
        if tasks.count == 0 {
            tasks.append(task)
            run(task: task)
            return
        }
        if level == .high { // 高级别插入头部
            for index in 0..<tasks.count {
                let indexTask = tasks[index]
                if indexTask.level != .high && indexTask.status == .unstarted {
                    tasks.insert(task, at: index)
                    return
                }
            }
            
        }
        //低级别或最后时间点,插入尾部
       tasks.append(task)
    }
    
    func run(task: Task) -> Void {
        print((task.name ?? "") + " start")
        
       // Dispatch
        task.status = .running
//        DispatchQueue.main.asyncAfter(deadline: .now()) {
//
//        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            print((task.name ?? "") + " end")
            task.status = .finished
            self.tasks.remove(at: 0)
            if self.tasks.count > 0 {
                self.run(task: self.tasks.first!)
            }

        }
       
    }

}
