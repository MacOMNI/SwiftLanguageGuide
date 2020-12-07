//
//  ImageDownManager.swift
//  AdvertisementView
//
//  Created by Mackun on 2020/12/7.
//  Copyright © 2020 Xcode. All rights reserved.
//

import UIKit

typealias DownLoadComplection = (_ isSucess: Bool, _ image: UIImage?) -> Void

class ImageDownManager: NSObject {
    //单例
    public static let sharedManager: ImageDownManager = ImageDownManager()
    //队列
    private static let queue = DispatchQueue.init(label: String(describing: ImageDownManager.self))
    
    private var timer: Timer?
    override init() {
        super.init()
        
    }
    
    func loadDownImageUrl(url: String, complection: DownLoadComplection?) {
        // 格式校验
        guard let imagUrl = NSURL(string: url) else {
            complection?(false,nil)
            return
        }
        // 缓存中有
        if ImageCacheManager.sharedManager.isExtImageUrl(url: imagUrl), let image = ImageCacheManager.sharedManager.getCacheImageUrl(url: imagUrl) {
            complection?(true,image)
            return
        }
        
        downLoadImageUrl(url: imagUrl, completion: complection)
        
    }
    
    func downLoadImageUrl(url: NSURL, completion: DownLoadComplection?){
        
        
    }
    
    
    
    
}
