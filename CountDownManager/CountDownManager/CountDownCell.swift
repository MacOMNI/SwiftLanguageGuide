//
//  CountDownCell.swift
//  CountDownManager
//
//  Created by Mackun on 2020/11/23.
//

import UIKit

//protocol CountDownProtocal: NSObject {
//    func updateCountDown(count: String) -> Void
//}

extension CountDownCell: CountDownProtocal {
    func updateCountDown(count: String, obj: AnyObject?) {
        if obj === self {
            let currentCount = Int(count) ?? 0
            let showTx = String(format: "%02d:%02d", currentCount/60,currentCount%60)
            detailTextLabel?.text = showTx
        } else {
            print("detailTextLabel 不对")
        }
        
    }
    
}

class CountDownCell: UITableViewCell {

   // weak var delegate:CountDownProtocal?

//    var dataTask: CountDownTask?
    
    var model: CountDownModel?  {
        didSet {
            guard let model = model else {
                return
            }
            textLabel?.text = model.title
            let  dataTask = CountDownTask.init(startTime: model.startTime, lastTime: model.lastTime, obj: self)
            dataTask.delegate = self
            CountDownTaskManager.sharedManager.updateTaskCount(task: dataTask, index: nil)
            CountDownTaskManager.sharedManager.addTask(task: dataTask)
            
        }
    
    }
    
    
    func countAction() -> Void {
        
    }
    
    deinit {
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
       // self.dataTask = nil
       // self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
       // self.delegate = self
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
