//
//  CountDownCell.swift
//  CellDownCountProject
//
//  Created by Mackun on 2020/11/19.
//  Copyright © 2020 Xcode. All rights reserved.
//

import UIKit
extension UITableViewCell {
    static func cellReuseIdentifier() -> String {
        return String(describing: self)
    }
}
class CountDownCell: UITableViewCell {
    
    var model: CountDownModel? {
        didSet {
            self.textLabel?.text = model?.title
            countAction()
        }
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        addNotification()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addNotification()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func addNotification() -> Void {
        NotificationCenter.default.addObserver(self, selector: #selector(countAction), name: .CountDownNotification, object: nil)
    }
    
    @objc func countAction() -> Void {
        guard let model = model else {
            return
        }
        let currentCount  = model.count -  CountDownHelpManager.sharedManager.currentTimerInterval()
        if currentCount <= 0 { // finished
            self.detailTextLabel?.text = "Counting Had Finished"
        } else {
            let showTx = String(format: "%02d:%02d", currentCount/60,currentCount%60)
            self.detailTextLabel?.text = showTx
        }
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
