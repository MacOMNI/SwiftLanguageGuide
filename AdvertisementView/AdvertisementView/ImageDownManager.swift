//
//  ImageDownManager.swift
//  AdvertisementView
//
//  Created by Mackun on 2020/12/7.
//  Copyright © 2020 Xcode. All rights reserved.
//

import UIKit

typealias DownLoadComplection = (_ isSucess: Bool, _ image: UIImage?) -> Void


class Constant: NSObject {
    public static let timerOutInteval: TimeInterval = 3
}

class ImageDownManager: NSObject {
    //单例
    public static let sharedManager: ImageDownManager = ImageDownManager()
    //队列
    private let queue = OperationQueue.init()
    
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
    
    private func downLoadImageUrl(url: NSURL, completion: DownLoadComplection?){
        let req = URLRequest.init(url: url as URL,  timeoutInterval: Constant.timerOutInteval)
        
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = Constant.timerOutInteval
        config.timeoutIntervalForResource = Constant.timerOutInteval
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        
        let session = URLSession.init(configuration: config, delegate: nil, delegateQueue: queue)
        
        let dataTask = session.dataTask(with: req) { (data, _, error) in
            if error != nil {
                DispatchQueue.main.async {
                    completion?(false,nil)
                }
                return
            }
            
            guard let data = data, let image = UIImage.init(data: data) else {
                DispatchQueue.main.async {
                    completion?(false,nil)
                }
                return
            }
            
            ImageCacheManager.sharedManager.setCacheImage(url: url, image: image)
            DispatchQueue.main.async {
                completion?(true,image)
            }
        }
        dataTask.resume()
    }
    
    
    
    
}

//extension ImageDownManager: URLSessionDelegate {
//
//}
