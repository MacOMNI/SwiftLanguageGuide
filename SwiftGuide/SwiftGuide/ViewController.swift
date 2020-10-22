//
//  ViewController.swift
//  SwiftGuide
//
//  Created by Mackun on 2020/10/19.
//  Copyright © 2020 Xcode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customView: CustomImgTitleView!
    @IBOutlet weak var numberStepperView: NumberStepper!
  //  private var numberFrameView : NumberStepper
    override func viewDidLoad() {
        super.viewDidLoad()
       // numberStepperView.layout()
       // view.addSubview(numberView)
        // Do any additional setup after loading the view.
    }
    
    lazy var numberView : NumberStepper = {
        let view = NumberStepper.init(frame: CGRect.init(x: 0, y: 300, width: UIScreen.main.bounds.size.width, height: 100))
        return view
    }()

}

