//
//  CountDownHelpManager.swift
//  CellDownCountProject
//
//  Created by Mackun on 2020/11/18.
//  Copyright © 2020 Xcode. All rights reserved.
//

import UIKit

extension NSNotification.Name {
    public static let CountDownNotification = NSNotification.Name("CountDownNotification")
}

class CountDownHelpManager: NSObject {
    public static let sharedManager = CountDownHelpManager()
    private var timerInterval:Int = 0
    private var timer:Timer?
    
    override init() {
        super.init()
    }
    
    func startCount() {
        timerInterval = 0
        if timer == nil {
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
            RunLoop.current.add(timer!, forMode: .common)
                // let loop = RunLoop.init()
           // loop.add(NSMachPort.init(), forMode: .common)
        }
    }
    
    @objc private func timerAction() -> Void {
       // let interval = timerInterval
        timerInterval  += 1
        print("timerInterval  =  \(timerInterval)")
        NotificationCenter.default.post(name: .CountDownNotification, object: nil)
    }
    
    func reload() {
        timer?.invalidate()
        timer = nil
        timerInterval = 0
    }
    
    func currentTimerInterval() -> Int {
        return timerInterval
    }
    
    deinit {
        timer?.invalidate()
        timer = nil
        
    }
    
   
    
}
