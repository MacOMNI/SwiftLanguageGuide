//
//  CustumView.swift
//  SwiftGuide
//
//  Created by Mackun on 2020/10/22.
//  Copyright © 2020 Xcode. All rights reserved.
//

import Foundation
import UIKit
// 自定义 custom view 支持
@IBDesignable
class CustomImgTitleView:UIView {
    @IBInspectable
    var imageName : String = "settings_telegram" {
        didSet {
            imageView.image = UIImage.init(named:imageName)
        }
    }
    @IBInspectable
    var title : String = "" {
        didSet {
            titleLabel.text = String(title)
        }
    }
    @IBInspectable var des : String?  {
        didSet {
            if let  _ = des {
                NSLayoutConstraint.deactivate(deactive)
            }
            desLabel.text = des
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        upLayout()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        upLayout()
    }
    
    func setup()  {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(desLabel)
    }
    
    func upLayout() {
        let leadingMargin = CGFloat(10.0)
       // let segmentMargin = CGFloat(5.0)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leadingMargin),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            //   imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(greaterThanOrEqualToConstant: 40),
            imageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 40),
            imageView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: leadingMargin),
            titleLabel.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: leadingMargin),
            titleLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: leadingMargin),
            titleLabel.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor, constant: -leadingMargin),
            
            titleLabel.bottomAnchor.constraint(equalTo: desLabel.topAnchor),
            desLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            desLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
            desLabel.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor, constant: -leadingMargin),
        ])
        NSLayoutConstraint.activate(deactive)

    }
    lazy var deactive : [NSLayoutConstraint] = {
        return [titleLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor)]
    }()

    lazy var imageView : UIImageView = {
        let view = UIImageView.init()
        view.translatesAutoresizingMaskIntoConstraints = false
        let img = UIImage.init(named:imageName)
        view.image = img
        return view
    }()
    lazy var titleLabel : UILabel = {
        let label = UILabel.init()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.text = String(title)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    lazy var desLabel : UILabel = {
        let label = UILabel.init()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 0
        if let des = des {
            label.text = String(des)
        }
        label.textColor = .gray
        return label
    }()
}
