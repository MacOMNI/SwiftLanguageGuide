//
//  ImageCacheManager.swift
//  AdvertisementView
//
//  Created by Mackun on 2020/12/7.
//  Copyright © 2020 Xcode. All rights reserved.
//

import UIKit

class ImageCacheManager: NSObject {

    public static let sharedManager = ImageCacheManager()
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
    
    public func isExtImageUrl(url: NSURL) -> Bool {
        guard let _ =  cache.object(forKey: url) else {
            return false
        }
        return true
    }
    
    
    public func setCacheImage(url:NSURL, image: UIImage) -> Void {
        cache.setObject(image, forKey: url)
    }
    
    public func getCacheImageUrl(url:NSURL) -> UIImage? {
       return cache.object(forKey: url)
    }
    
    

    
    
}
