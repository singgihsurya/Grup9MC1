//
//  NotificationCell.swift
//  Grup9MC1
//
//  Created by Bryanza on 07/04/20.
//  Copyright © 2020 Singgih Surya Dharma. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {
    @IBOutlet weak var remindLabel: UILabel!
    @IBOutlet weak var routineLabel: UILabel!
    @IBOutlet weak var experienceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(long))  //Long function will call when user long press on button.
        
        experienceLabel.addGestureRecognizer(longGesture)
    }
    
    @objc func long() {
        if tempeat.count > 0 && tempdate[selectedNotification] == dateString{
            totalExperience += experience[tempeat[selectedNotification]]!
            progressBarVC.frame.size.width = CGFloat(totalExperience) * 0.183
            progressLabelVC.text = "\(totalExperience)/\(totalLevel)"
            tempeat.remove(at: selectedNotification)
            tempdate.remove(at: selectedNotification)
            temptime.remove(at: selectedNotification)
            userDefault.set(tempeat, forKey: "makan")
            userDefault.set(tempdate, forKey: "tanggal")
            userDefault.set(temptime, forKey: "waktu")
            userDefault.synchronize()
            tableViewVC.reloadData()
            countExperience()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    func countExperience() {
        switch totalExperience {
        case 1000:
            levelLabelVC.text = "Level 2"
            totalLevel = 2000
            progressBarVC.frame.size.width = CGFloat(0)
        default:
            return
        }
    }
}
