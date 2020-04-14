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
    var selectedIndexPath: NSIndexPath = NSIndexPath()
    var tempLogin = 0
    var templastLogin = ""
    var index = 999
    
    @IBOutlet weak var listTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.isScrollEnabled = false
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
//        initCheckLogin()
        
        
        
        // Do any additional setup after loading the view.
    }
    //check daily login -> harusnya di page foodventure
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
