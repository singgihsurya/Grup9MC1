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
var timeString: String = ""
//var dayInt: Int = 0
var dateString: String = ""

var selectedNotification = 0

//var notifications = [
//    Notification(remind: "09.00 AM", routine: "Breakfast", experience: 10),
//    Notification(remind: "12.30 PM", routine: "Lunch", experience: 30),
//    Notification(remind: "07.00 PM", routine: "Dinner", experience: 20),
//]
var experience = [
    "Breakfast": 100,
    "Lunch": 300,
    "Dinner": 200,
]

var flagArr = [Bool]()

var currentLevel = 1
var totalExperience = 0
var totalLevel = 1000
var progressBarVC: UIView!
var progressLabelVC: UILabel!
var levelLabelVC: UILabel!
var tableViewVC: UITableView!

class FoodventureViewController: UIViewController {
    
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    var countArr = 0
    var tempLogin = 0
    var templastLogin = ""
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var latestImage: UIImageView!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    override func viewDidLoad() {
//        self.tableView.register(UINib(nibName: "NotificationCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
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
//        dayInt = getDayOfWeek(dateString)!
//                print(DateString)
        
        totalExperience = userDefault.integer(forKey: "total")
        currentLevel = userDefault.integer(forKey: "level")
        if currentLevel == 0 {
            currentLevel = 1
        }
        progressBarVC.frame.size.width = CGFloat(totalExperience) * 0.183
        progressLabelVC.text = "\(totalExperience)/\(totalLevel)"
        if let loadLastLogin = userDefault.string(forKey: "lastlogin"){
            templastLogin = loadLastLogin
        }
        tempLogin = userDefault.integer(forKey: "login")
        initCheckLogin()
        latestachievement()
        
//        flagArr.reserveCapacity(temptime.count)
        if let loadflag = userDefault.array(forKey: "sudah"){
            flagArr = loadflag as! [Bool]
        }else{
            flagArr = Array<Bool>(repeating: false, count: temptime.count)
        }
        checkTimeNotification()
//        tableView.register(NotificationCell.self, forCellReuseIdentifier: reuseIdentifier)
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        checkTimeNotification()
//    }
    
    //check daily login -> harusnya di page foodventure
    func initCheckLogin(){
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let currentDate = dateFormatter.string(from: date)
        if templastLogin != currentDate {
            tempLogin+=1
            userDefault.set(tempLogin, forKey: "login")
            userDefault.set(currentDate, forKey: "lastlogin")
        }
        print(tempLogin)
    }
    //    untuk latest achievement-foodventure page
    func latestachievement(){
        var pictBadges = ""
        var latestbadgesArray = [String]()
        let defaultload = UserDefaults.standard
//                userdefaultnya ini nanti dari array achievement yang udah didapatin.
        if let badges = defaultload.stringArray(forKey: "latestbadge"){
            latestbadgesArray = badges
            print(badges)
            if let tempnameimg = latestbadgesArray.last{
                pictBadges = tempnameimg
                latestImage.image = #imageLiteral(resourceName: pictBadges)
            }
        }
    }
    
    func checkTimeNotification(){
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
//        let currentCell = tableView.cellForRow(at: IndexPath(index: 0)) as! NotificationCell
        var tempIndex = 0
        for time in temptime {
            if time != "" {
                if formatter.date(from: timeString)! >= formatter.date(from: time)! {
                    flagArr[tempIndex] = true
//                    let alert = UIAlertController(title: "Alert", message: "It's time to eat your \(tempeat[tempIndex]) now", preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
//                    self.present(alert, animated: true)
                    let alert = UIAlertController(title: "",
                                                  message: "It's time to eat your \(tempeat[tempIndex]) now",
                                                  preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Okay, I will eat", style: .default) { (action) in
                        self.appDelegate?.scheduleNotification(notificationType: tempeat[tempIndex])
                    }
                    alert.addAction(okAction)
                    present(alert, animated: true, completion: nil)
                    userDefault.set(flagArr, forKey: "sudah")
                    userDefault.synchronize()
                    tableView.reloadData()
                    break
                }
            }
            tempIndex += 1
        }
    }
}

extension FoodventureViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var flag = false
        countArr = 0
        for date in tempdate {
            if date == dateString {
                countArr += 1
                flag = true
            }
        }
        if flag {
            return countArr
        }else{
            return tempdate.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var tempIndex = 0
        var flag = false
        if countArr < tempdate.count && countArr != 0{
            flag = true
            var countIndex = 0
            for date in tempdate {
                if date == dateString{
                    countIndex += 1
                }
                if countIndex - 1 >= indexPath.row {
                    break
                }
                tempIndex += 1
            }
        }
        let eat, time, date: String
        if flag {
            eat = tempeat[tempIndex]
            time = temptime[tempIndex]
            date = tempdate[tempIndex]
        }else{
            eat = tempeat[indexPath.row]
            time = temptime[indexPath.row]
            date = tempdate[indexPath.row]
        }
//        let notification = notifications[indexPath.row]
//        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
//        cell.textLabel?.text = notification.remind
//        cell.detailTextLabel?.text = String(notification.experience)
//        return cell
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? NotificationCell {
            if date == dateString {
                cell.remindLabel.text = time
                cell.routineLabel.text = eat
                if flagArr[indexPath.row] {
                    cell.experienceLabel.text = String(experience[eat]!) + " FP"
                    cell.experienceLabel.isHidden = false
                }else{
                    cell.experienceLabel.isHidden = true
                }
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedNotification = indexPath.row
    }
    
    func getDayOfWeek(_ today:String) -> Int? {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let todayDate = formatter.date(from: today) else { return nil }
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: todayDate)
        return weekDay
    }
}

extension Date {
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }
}
