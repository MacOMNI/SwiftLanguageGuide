//
//  ViewController.swift
//  AdvertisementView
//
//  Created by Mackun on 2020/11/2.
//  Copyright © 2020 Xcode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    private var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.init(timeInterval: 3, repeats: true, block: { (_) in
            ImageDownManager.shared.loadDownImageUrl(url: "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1963442875,1146947704&fm=26&gp=0.jpg") { [weak self](isSuccess, image) in
                print(isSuccess)
                if isSuccess {
                    self?.imageView.image = image
                }
            }
        })
        RunLoop.current.add(timer!, forMode: .common)
        
       
        // Do any additional setup after loading the view.
    }

    deinit {
        timer?.invalidate()
        timer = nil
    }

}

