//
//  TimeManageVC.swift
//  Grup9MC1
//
//  Created by Singgih Surya Dharma on 07/04/20.
//  Copyright © 2020 Singgih Surya Dharma. All rights reserved.
//

import UIKit
var currentIndex = 0
class TimeManageVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    var setTime = ""
    var setCategoryMakan =  ""
    var setDate = ""
    
    var arrayTime = [String]()
    var arrayMakan = [String]()
    var arrayDate = [String]()
    var arraycategoryMakan: [String] = [String]()
    
    
    var loadTime = [String]()
    var loadMakan = [String]()
    var loadDate = [String]()
    
    var tempeat = [String]()
    var tempdate = [String]()
    var temptime = [String]()
    
    var indexOperan = 999
    
    
    @IBOutlet weak var pickerCategoryMakan: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerCategoryMakan.delegate = self
        pickerCategoryMakan.dataSource = self
        arraycategoryMakan =  ["Breakfast", "Lunch", "Dinner"]
        currentIndex = 0
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
        initEditPicker(index: indexOperan)
        
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

    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arraycategoryMakan.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arraycategoryMakan[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        setCategoryMakan = arraycategoryMakan[row]
    }
    
    
    @IBAction func cancelBtn(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBAction func timePickerChanged(_ sender: Any) {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = DateFormatter.Style.short
        let strTime = timeFormatter.string(from: timePicker.date)
        //print(strTime)
        setTime =  strTime
        
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .short
        let strDate = dateformatter.string(from: timePicker.date)
        //print(strDate)
        setDate =  strDate
        
    }
    func initEditPicker(index: Int){
        if index == 999{
            
        }else{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm a"
            if let time = dateFormatter.date(from: temptime[index]) {
                timePicker.date = time
            }
            if tempeat[index] == "Breakfast"{
                pickerCategoryMakan.selectRow(0, inComponent: 0, animated: true)
            } else if tempeat[index] == "Lunch"{
                pickerCategoryMakan.selectRow(1, inComponent: 0, animated: true)
            } else if tempeat[index] == "Dinner"{
                pickerCategoryMakan.selectRow(2, inComponent: 0, animated: true)
            }
            
        }
        
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        
        arrayDate = tempdate
        arrayMakan = tempeat
        arrayTime = temptime
        
        if setTime == "" || setDate == ""{
            let timeFormatter = DateFormatter()
            timeFormatter.timeStyle = DateFormatter.Style.short
            let strTime = timeFormatter.string(from: timePicker.date)
            //print(strTime)
            setTime =  strTime
            
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = .short
            let strDate = dateformatter.string(from: timePicker.date)
            //print(strDate)
            setDate =  strDate
        }
        
        if setCategoryMakan == ""{
            setCategoryMakan = "Breakfast"
        }
        
        //replace value of array
        //var longArr = arrayMakan.count
            
            var keterangan = replaceArrayValue(setCategoryMakan: setCategoryMakan)
            print(keterangan)
            if keterangan == "tidakada"{
                arrayTime.append(setTime)
                arrayMakan.append(setCategoryMakan)
                arrayDate.append(setDate)
                print(arrayMakan, arrayTime, arrayDate)
            }else{
                arrayTime[currentIndex] = setTime
                arrayMakan[currentIndex] = setCategoryMakan
                arrayDate[currentIndex] = setDate

              
            }
            let defaultsave =  UserDefaults.standard
            defaultsave.set(arrayMakan, forKey: "makan")
            defaultsave.set(arrayTime, forKey: "waktu")
            defaultsave.set(arrayDate, forKey: "tanggal")
            
        }
        
        func replaceArrayValue(setCategoryMakan: String) -> String  {
            
            var keterangan = ""
            for name in arrayMakan{
                if name == setCategoryMakan{
                    keterangan = "ada"
                    return keterangan
                    break
                }
                currentIndex+=1
            }
            keterangan = "tidakada"
            return keterangan
        }
}
