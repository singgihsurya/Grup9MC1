//
//  FoodventureViewController.swift
//  Grup9MC1
//
//  Created by Bryanza on 05/04/20.
//  Copyright © 2020 Singgih Surya Dharma. All rights reserved.
//

//import Foundation

import UIKit

private let reuseIdentifier = "notificationCell"

var indexPathSelected: IndexPath!
var selectedNotification = 0

var notifications = [
    Notification(remind: "09.00 AM", routine: "Breakfast", experience: 10),
    Notification(remind: "12.30 PM", routine: "Lunch", experience: 30),
    Notification(remind: "07.00 PM", routine: "Dinner", experience: 20),
]

var totalExperience = 500
var totalLevel = 1000
var progressBarVC: UIView!
var progressLabelVC: UILabel!
var levelLabelVC: UILabel!
var tableViewVC: UITableView!

class FoodventureViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        progressBarVC = progressBar
        progressLabelVC = progressLabel
        levelLabelVC = levelLabel
        tableViewVC = tableView
        super.viewDidLoad()
    }
}

extension FoodventureViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let notification = notifications[indexPath.row]
//        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
//        cell.textLabel?.text = notification.remind
//        cell.detailTextLabel?.text = String(notification.experience)
//        return cell
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? NotificationCell {
            cell.remindLabel.text = notification.remind
            cell.routineLabel.text = notification.routine
            cell.experienceLabel.text = String(notification.experience) + " FP"
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexPathSelected = indexPath
        selectedNotification = indexPath.row
    }
}
