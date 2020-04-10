//
//  ListScheduleVC.swift
//  Grup9MC1
//
//  Created by Singgih Surya Dharma on 07/04/20.
//  Copyright © 2020 Singgih Surya Dharma. All rights reserved.
//

import UIKit

class ListScheduleVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var temptime = [String]()
    var tempeat = [String]()
    var tempdate = [String]()
    var tempLogin = 0
    var templastLogin = ""
    var selectedIndexPath: NSIndexPath = NSIndexPath()
    var index = 999
    
    @IBOutlet weak var listTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.delegate = self
        listTableView.dataSource = self
        
        let defaultload = UserDefaults.standard
//        loadMakan = defaultload.stringArray(forKey: "makan") ?? [""]
//        loadTime = defaultload.stringArray(forKey: "waktu") ?? [""]
//        loadDate = defaultload.stringArray(forKey: "tanggal") ?? [""]
        
        if let loadMakan = defaultload.stringArray(forKey: "makan") as? [String]{
            tempeat = loadMakan
        }
        if let loadTime = defaultload.stringArray(forKey: "waktu") as? [String]{
            temptime = loadTime
        }
        if let loadDate = defaultload.stringArray(forKey: "tanggal") as? [String]{
            tempdate = loadDate
        }
        if let loadLastLogin = defaultload.string(forKey: "lastlogin") as? String{
            templastLogin = loadLastLogin
        }
        if let loadLogin = defaultload.integer(forKey: "login") as? Int{
            tempLogin = loadLogin
        }
        initCheckLogin()
        
        
        /// visit apps daily
        //                //daily login check
        //                let logindefault = UserDefaults.standard
        //                let date = DateChecking()
        //                var tempdate = ""
        //                //var tempcount = ""
        //                var count = 0
        //                let loadlogin = UserDefaults.standard
        //                if let lastlog = loadlogin.string(forKey: "logindate"){
        //                    tempdate = lastlog
        //                    print(tempdate)
        //                }
        //                let tempcount = loadlogin.string(forKey: "counterlogin") ?? "0"
        //                print(tempcount)
        //                if date == tempdate{
        //                    count = (Int(tempcount) ?? 1) + 1
        //                    logindefault.set(date, forKey: "logindate")
        //                    logindefault.set(count, forKey: "counterlogin")
        //                }
        //
        //
        //
        //
        //                //load lastlogin userdef
        //                //kalo beda baru nambah counternya.
        //
        //
        //
        //
        //
        //          //  untuk itung visit apps harian
        //
        //            func DateChecking()->String{
        //                var tempdate = ""
        //                let dateformatter = DateFormatter()
        //                dateformatter.dateStyle = .short
        //                let DateString = dateformatter.string(from: Date())
        //                tempdate = DateString
        //                return tempdate
        //            }
                //current time
        //        let timeformatter = DateFormatter()
        //        timeformatter.timeStyle = .short
        //        let TimeString = timeformatter.string(from: Date())
                //print(TimeString)
                //current date
        //        let dateformatter = DateFormatter()
        //        dateformatter.dateStyle = .short
        //        let DateString = dateformatter.string(from: Date())
                //print(DateString)
        
        // Do any additional setup after loading the view.
    }
    
    func initCheckLogin(){
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let currentDate = dateFormatter.string(from: date)
        if templastLogin != currentDate {
            tempLogin+=1
            UserDefaults.standard.set(tempLogin, forKey: "login")
            UserDefaults.standard.set(currentDate, forKey: "lastlogin")
        }
        print(templastLogin)
        print(tempLogin)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempeat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        cell.textLabel?.text = temptime[indexPath.row]
        cell.detailTextLabel?.text =  tempeat[indexPath.row] + " Time" 
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndexPath = indexPath as NSIndexPath
        index = indexPath.row
        print(index)
        self.performSegue(withIdentifier: "editSegue", sender: self)
        index = 999
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editSegue"{
            if let destination = segue.destination as? TimeManageVC{
                destination.indexOperan = index
            }
        }
    }
    
    


}
