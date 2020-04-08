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
let userDefault = UserDefaults.standard
var temptime = [String]()
var tempeat = [String]()
var tempdate = [String]()
private var timeString: String = ""
var dateString: String = ""

var selectedNotification = 0

//var notifications = [
//    Notification(remind: "09.00 AM", routine: "Breakfast", experience: 10),
//    Notification(remind: "12.30 PM", routine: "Lunch", experience: 30),
//    Notification(remind: "07.00 PM", routine: "Dinner", experience: 20),
//]
var experience = [
    "Breakfast": 10,
    "Lunch": 30,
    "Dinner": 20,
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
        if let loadMakan = userDefault.stringArray(forKey: "makan"){
            tempeat = loadMakan
        }
        if let loadTime = userDefault.stringArray(forKey: "waktu"){
            temptime = loadTime
        }
        if let loadDate = userDefault.stringArray(forKey: "tanggal"){
            tempdate = loadDate
        }
//        current time
        let timeformatter = DateFormatter()
        timeformatter.timeStyle = .short
        timeString = timeformatter.string(from: Date())
//                print(TimeString)
//                current date
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .short
        dateString = dateformatter.string(from: Date())
//                print(DateString)
    }
}

extension FoodventureViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var tempCount = 0
        for date in tempdate {
            if date == dateString {
                tempCount += 1
            }
        }
        return tempCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eat = tempeat[indexPath.row]
        let time = temptime[indexPath.row]
        let date = tempdate[indexPath.row]
//        let notification = notifications[indexPath.row]
//        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
//        cell.textLabel?.text = notification.remind
//        cell.detailTextLabel?.text = String(notification.experience)
//        return cell
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? NotificationCell {
            if date == dateString {
                cell.remindLabel.text = time
                cell.routineLabel.text = eat
                cell.experienceLabel.text = String(experience[eat]!) + " FP"
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedNotification = indexPath.row
    }
}
