//
//  CountDownModel.swift
//  CellDownCountProject
//
//  Created by Mackun on 2020/11/19.
//  Copyright © 2020 Xcode. All rights reserved.
//

import UIKit

class CountDownModel: NSObject {

    var title: String?
    var count: Int = 0
    init(title: String, count: Int) {
        self.title = title
        self.count = count
    }
    
}
