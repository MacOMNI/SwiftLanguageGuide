//
//  ImageCacheManager.swift
//  AdvertisementView
//
//  Created by Mackun on 2020/12/7.
//  Copyright © 2020 Xcode. All rights reserved.
//

import UIKit

class ImageCacheManager: NSObject {

    public static let shared = ImageCacheManager()
  // private let cache = NSCache<NSURL,UIImage>()
    
    override init() {
        super.init()
        
    }
    // nscache 线程安全
    private lazy var cache: NSCache<NSURL,UIImage> = {
       let ch = NSCache<NSURL,UIImage>()
        ch.countLimit = 10
        ch.totalCostLimit = 1024 * 1024
       return ch
    }()
    
    subscript(url: NSURL) -> UIImage? {
        get {
            cache.object(forKey: url)
        }
        set {
            guard let newValue = newValue else { return }
            cache.setObject(newValue, forKey: url)
        }
    }
    
//    public func setCacheImage(url:NSURL, image: UIImage) -> Void {
//        cache.setObject(image, forKey: url)
//    }
//
//    public func getCacheImageUrl(url:NSURL) -> UIImage? {
//       return cache.object(forKey: url)
//    }
//
    

    
    
}
