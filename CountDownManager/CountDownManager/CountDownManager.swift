//
//  CountDownManager.swift
//  CountDownManager
//
//  Created by Mackun on 2020/11/23.
//

import UIKit
import Foundation

protocol CountDownProtocal: NSObject {
    func updateCountDown(count: String,obj: AnyObject?) -> Void
}
class CountDownTaskManager: NSObject {
    
    public static let sharedManager = CountDownTaskManager()
    private var timer: Timer?
    private var tasks = SafeArray<CountDownTask>.init()
    
    override init() {
        super.init()
        timer = Timer.init(timeInterval: 1, target: self, selector: #selector(runTasks), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: .common)
    }
    
    
    func addTask(task: CountDownTask) {

        for index in (0..<tasks.count).reversed() {
            let curTask = tasks.safeIndex(index: index)
            if task.obj === curTask?.obj {
                tasks.remove(at: index)
            }
        }
        
        tasks.append(task)
        print("addTask = ",tasks.count)
        
        
    }
    
    public func reloadTask() -> Void {
        tasks.removeAll()
    }
    
    @objc private func runTasks() -> Void {
        for index in (0..<tasks.count).reversed() {
            let task = tasks.safeIndex(index: index)
            updateTaskCount(task: task, index: index)
        }
    }
    func updateTaskCount(task: CountDownTask?,index: Int?) -> Void {
        guard let task = task else { return }
       
        let currentTime = Int(Date.init().timeIntervalSince1970)
        let last = task.lastTime + task.startTime - currentTime

        task.delegate?.updateCountDown(count: "\(last)",obj: task.obj)
        
        guard let index = index else { return }
        if  last <= 0 {
            tasks.remove(at: index)
        }
    }

    
    deinit {
        timer?.invalidate()
        timer = nil
    }
    
    
}

public class SafeArray<Elment> {
    fileprivate let queue = DispatchQueue.init(label: "safeArrayQueue", qos: .default, attributes: .concurrent)
    fileprivate var array = [Elment]()
}
extension SafeArray {
    
    var count: Int {
        var res = 0
        queue.sync {
            res = self.array.count
            print("SafeArray count = ",res)
        }
        return res
    }
    
    
    func append(_ elment: Elment) -> Void {
        queue.async(flags: .barrier) {
            self.array.append(elment)
        }
    }
    
    func safeIndex(index: Int) -> Elment? {
        
        var res: Elment?
        queue.sync {
            guard self.array.startIndex..<self.array.endIndex ~= index else { return }
            res = self.array[index]
        }
        return res
    }
    
    func remove(at index: Int) -> Void {
        queue.async( flags: .barrier) {
            self.array.remove(at: index)
        }
    }
    
    func removeAll() -> Void {
        queue.async(flags: .barrier) {
            self.array.removeAll()
        }
    }
}

class CountDownTask: NSObject {
    weak var delegate: CountDownProtocal?
    public weak var obj: AnyObject?
    public var startTime: Int = 0
    public var lastTime: Int = -1
    
    init(startTime: Int, lastTime: Int, obj: AnyObject?) {
        self.obj  = obj
        self.lastTime = lastTime
        self.startTime = startTime
    }
}
