//
//  SwiftTour.swift
//  SwiftLanguageGuide
//
//  Created by Mackun on 2020/10/19.
//  Copyright © 2020 Xcode. All rights reserved.
//

import Foundation

func swiftTourDemo() {
    // let var
    print("Hello, world!")
    let name :String = "MacKun";
    let age:Int = 30;
    print("I am \(name),\(age) years old!")
    // array
    var myLoveList = ["Apple","Fish","Cat","Dog"];
    myLoveList.append("Water")
    for index in 0..<myLoveList.count {
        print("item \(index):\(myLoveList[index])")
    }
    for index  in myLoveList.reversed() {
            print("reversed item = ",index)
    }
    for index  in (0..<myLoveList.count).reversed() {
        print("reversed index =  \(index),\(myLoveList[index])")
    }
    myLoveList.removeAll()
    // dictionary
    var dict :[String:String] = [
        "swift":"5.3",
        "java":"8.0",
    ];
    dict["oc"] = String(4.0)
    dict["ios"] = nil
    let optionalKeyString :String? = nil
    let optionalValueString :String? = ""
    if let keySting = optionalKeyString {
        dict[keySting] = optionalValueString
    } else {
        dict[""] = optionalValueString

    }
    for (key,value) in dict {
        print("key = \(key),value = \(value)")
    }
//    guard let keyString = optionalKeyString else {
//        optionalKeyString = ""
//        print("Optional key is error!")
//    }

    print("dic = \(dict)")
    // func
    var scores = [Float]()
    scores.append(90)
    scores.append(93.5)
    scores.append(83.5)
    
    print(updateScorces(scores: scores))
    
}

func updateScorces(scores:[Float]) -> (max:Float,min:Float,average:Float) {
    var max = scores[0]
    var min = scores[0]
    var sum = scores[0]
    let count = scores.count
    for index in 1..<count {
        let score = scores[index]
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (max,min,sum/Float(count))
}
