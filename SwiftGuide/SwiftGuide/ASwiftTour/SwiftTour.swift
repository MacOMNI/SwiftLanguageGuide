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
    actionNumbers()
    let retangle = RetangleShape.init(m: 5, n: 4,name: "ratangle")
    print(retangle.desShapeSides())
    print(retangle.len)
    
    // enum
    let coin = Coin.init(rawValue: 2)
    print(coin?.CoinDescription() as Any)
    let manager = NetManager.init(request: Response.result("www.baidu.com", "post"))
    print(manager.managerDescription())
    // protocal
    let show =   ShowGuide.init(dec: "Start!")
    print(show.showExample())
    show.adjust()
    print(show.showExample())
    
}
protocol ExampleProtocal {
    var exampleDescription:String { get }
    func showExample() -> String
    mutating func adjust()
}
class ShowGuide: ExampleProtocal {
    var exampleDescription: String
    
    func showExample() -> String {
        return exampleDescription
    }
    
    func adjust() {
        exampleDescription = "Show random is \(arc4random()/1000)"
    }
    
    init(dec :String) {
        self.exampleDescription = dec
    }
    
}
class NetManager {
    var request :Response
    init(request:Response) {
        self.request = request
    }
    func managerDescription() -> String {
        switch self.request {
        case let .result(url, params):
            return "url = \(url),params = \(params)"
        case let .failure(err):
            return "failure = \(err)"
        }
    }
}
enum Response {
    case result(String,String)
    case failure(String)
}
enum Coin :Int{
    case btc = 1
    case eth,eos,ht
    func CoinDescription() -> String {
        switch self {
        case .btc:
            return "Bitcoin"
        default:
            return String(self.rawValue)
        }
    }
    
}
class NamedShape {
    var numberOfSides :Int = 0
    var name :String
    init(name:String) {
        self.name = name
    }
    func desShapeSides() -> String {
        return "The shape of \(name) has \(numberOfSides) sides."
    }
}
class RetangleShape: NamedShape {
    var m : Float
    var n : Float
    init(m:Float,n:Float,name:String) {
        self.m = m
        self.n = n
        super.init(name: name)
    }
    func area() -> Float {
        return m*n
    }
    var len:Float{
        get {
            return (m+n)*2
        }
    }
    override func desShapeSides() -> String {
        return "The shape area is \(area())"
    }
    
}
func actionNumbers() {
    var numbers = [Int]()
    for _ in 0..<10 {
        numbers.append(Int(arc4random()%100))
    }
    print(numbers)
    var mapNumbers = numbers.map { (a:Int) -> Int in
        return a + 3
    }
    
    print("3 + numbers = \(mapNumbers)")
    mapNumbers = mapNumbers.map({ number in 3*number})
    print("3*mapNumbers = \(mapNumbers)")
    var sortNumbers = mapNumbers.sorted { (a:Int, b:Int) -> Bool in
        return a < b
    }
    print("sortedNumber = \(sortNumbers)")
    sortNumbers = sortNumbers.sorted(by: { $0 > $1})
    print("sortedNumber = \(sortNumbers)")
    
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
