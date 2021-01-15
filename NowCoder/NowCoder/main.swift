//
//  main.swift
//  NowCoder
//
//  Created by Mackun on 2021/1/7.
//


import Foundation

var nums = [Int]()
while let line = readLine()  {
    if let _ = Int(line) {
        nums.append(Int(line)!)
    } else {
        break
    }
   
   // quickSort(nums: nums,left: 0,right: nums.count - 1)
}

insertSort(nums: nums)
//func quickSort(nums: [Int], left: Int, right: Int) ->[Int] {
//
//    let val = nums[left]
//    var nums = nums
//    var left = left
//    var right = right
//    while left < right {
//        while left < right && nums[left] <= val {
//            left = left + 1
//        }
//        nums[left] = val
//        while left < right && nums[right] >= val {
//            right = right - 1
//        }
//        (nums[left],nums[right]) = (nums[right],nums[left])
//    }
//
//    return nums
//}

func insertSort(nums: [Int]) {
    if nums.count <= 0 { return }
    var res = [Int]()
    res.append(nums[0])
    for i in 1..<nums.count {
        var haveInsert   = false
        for index in 0..<res.count {
            if nums[i] <= res[index] {
                res.insert(nums[i], at: index)
                haveInsert = true
                break
            }
        }
        if !haveInsert {
            res.append(nums[i])
        }
    }
    for item in res {
        print(item)
      //  print(\(item)/)
    }
   // return res
}



//while let line = readLine() {
//    let n = Int(line)!
//    print(countFrog(n: n))
//}
//func countFrog(n: Int) -> Int {
//    if n == 1 { return 1 }
//    if n == 2 { return 2 }
//    var pre = 1
//    var next = 2
//    for _ in 3..<n {
//       let ppre = pre
//       pre = next
//       next = next + ppre
//    }
//    return pre + next
//}


//let t = Int(readLine()!)!
////let t = readLine()?.split(separator: " ").map({
////    Int($0)!
////})[0]
//var hashMap = [String:Int]()
//for _ in 0..<t {
//    let str = readLine()!
//    if let cnt = hashMap[str] {
//      hashMap[str] = cnt + 1
//    } else {
//       hashMap[str] = 1
//    }
//}
//var res = 0
//for (_,val) in hashMap {
//    if Double(val) * 1.0 / Double(t) >=  0.01 {
//    res = res + 1
//  }
//}
//print(res)





//let t = readLine()?.split(separator: " ").map({ Int($0)!
//})[0]
//for _ in 0..<t! {
//    cntSum()
//}
//
//func cntSum() {
//    while let line = readLine() {
//
//        let array = line.split(separator: " ").map({
//            Int($0)!
//        })
//        if array[0] == 0 {
//            break
//        }
//        let res = array.reduce(0, +)
//        print(res - array[0])
//    }
//}


//while let line = readLine() {
//    let  strs = line.split(separator: ",").sorted(by: { (a, b) -> Bool in
//        return a + b > b + a
//    })
//    print(strs.joined(separator: ","))
//}

//while let line = readLine() {
//
//    let array = line.split(separator: " ").map({
//        Int($0)!
//    })
//    if array[0] == 0 {
//        break
//    }
//    let res = array.reduce(0, +)
//    print(res - array[0])
//}

//while let line = readLine() {
//    let parts = line.split(separator: " ")
//    let a =  Int(parts[0])!
//    let b = Int(parts[1])!
//    if a == 0 && b == 0 {
//       break
//    }
//    print(a + b)
//}

//let t = readLine()?.split(separator: " ").map({ Int($0)!
//})[0]
//for _ in 0..<t! {
//
//    print(Int((readLine()?.split(separator: " ").map({Int($0)!}).reduce(0, +))!))
//}

//while let line = readLine(), line != "break" {
//    let res = line.split(separator: " ").map { Int($0)! }.reduce(0, +)
//    print(res)
//}

//while let line = readLine() {
//    let parts:[Int] = line.split(separator: " ").map({
//        Int($0)!
//    })
//    if parts[0] == 0 {
//        break
//    }
//    let res = parts.reduce(0, +)
//    print(res - parts[0])
//}

//while let line = readLine() {
//    let parts = line.split(separator: " ")
//    let a =  Int(parts[0])!
//    let b = Int(parts[1])!
//    if a == 0 && b == 0 {
//       break
//    }
//    print(a + b)
//}


//let t:Int = Int(readLine()!)!
//
//for _ in 0..<t {
//    while let line = readLine(){
//        let parts = line.split(separator: " ")
//        print(Int(parts[0])! + Int(parts[1])!)
//    }
//}
//class ListNode {
//    var val:Int = 0
//    var next:ListNode?
//    init(val:Int) {
//        self.val = val
//        self.next = nil
//    }
//    init(val:Int,next:ListNode?) {
//        self.val = val
//        self.next = next
//    }
//}
//public class TreeNode {
//    public var val: Int
//    public var left: TreeNode?
//    public var right: TreeNode?
//    init() {
//        self.val = 0
//        self.right = nil
//        self.left = nil
//    }
//    init(val :Int) {
//        self.val = val
//        self.left = nil
//        self.right = nil
//    }
//    init(val: Int,left: TreeNode?,right: TreeNode?) {
//        self.val = val
//        self.left = left
//        self.right = right
//    }
//}
