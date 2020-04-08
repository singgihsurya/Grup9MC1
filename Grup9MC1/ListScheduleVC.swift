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
        
        
        
        // Do any additional setup after loading the view.
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
        self.performSegue(withIdentifier: "editSegue", sender: self)
    }
    
    
    


}
