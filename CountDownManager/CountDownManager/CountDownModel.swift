//
//  CountDownModel.swift
//  CountDownManager
//
//  Created by Mackun on 2020/11/23.
//

import Foundation



class CountDownModel {
    var title: String?
    var lastTime: Int = 0
    var startTime: Int = -1
    init(title: String?, lastTime: Int, startTime: Int) {
        self.title = title
        self.lastTime = lastTime
        self.startTime = startTime
    }
    
}
