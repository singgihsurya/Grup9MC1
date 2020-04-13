//
//  AchievementVC.swift
//  Grup9MC1
//
//  Created by Singgih Surya Dharma on 06/04/20.
//  Copyright © 2020 Singgih Surya Dharma. All rights reserved.
//

import UIKit
var dataAchievement = [Achievement]()
var tempImgAchievement = ""
var tempLblAchievement = ""
var selectedIndexPath: NSIndexPath = NSIndexPath()

var getAchievement = [String]()
var dailycount = 0
var level = 0
var currentidx = 0

class AchievementVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        initDataAchievement()
        collectionView.backgroundColor = #colorLiteral(red: 0.8945240378, green: 0.8995351195, blue: 0.9118962884, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
    func initDataAchievement() {
        let loaddailylogin =  UserDefaults.standard
        if let tempcount = loaddailylogin.object(forKey: "login") as? Int{
            dailycount = tempcount
        }

//        level = 100
        if let templevel =  loaddailylogin.object(forKey: "level") as? Int{
            level = templevel
        }
      
        let loadbadge = UserDefaults.standard
        if let tempbadge = loadbadge.stringArray(forKey: "latestbadge"){
            getAchievement = tempbadge
        }
        
        
        let savebadge = UserDefaults.standard

        let day1 = Achievement(title: "1 Day", imageName: "1_days", desc: "anda mendapatkan badge ini ketika pertama kali login", statusBadge: true)
        dataAchievement.append(day1)
        var keterangan = replaceArrayValue(tester: day1.imageName!)
        if keterangan == "tidakada"{
           getAchievement.append(day1.imageName!)
        }else if keterangan == "ada"{
            getAchievement[currentidx] = day1.imageName!
        }
        savebadge.set(getAchievement, forKey: "latestbadge")
        
        if dailycount >= 7{
            let day7 = Achievement(title: "7 Day", imageName: "7_days", desc: "", statusBadge: true)
            dataAchievement.append(day7)
            var keterangan = replaceArrayValue(tester: day7.imageName!)
            if keterangan == "tidakada"{
              getAchievement.append(day7.imageName!)
            }else if keterangan == "ada"{
               getAchievement[currentidx] = day7.imageName!
            }
            savebadge.set(getAchievement, forKey: "latestbadge")
        }else if dailycount < 7{
            let day7 = Achievement(title: "7 Day", imageName: "7_days_blur", desc: "", statusBadge: false)
            dataAchievement.append(day7)
        }
        
        if dailycount >= 30{
             let day30 = Achievement(title: "30 Day", imageName: "30_days", desc: "", statusBadge: true)
            dataAchievement.append(day30)
            var keterangan = replaceArrayValue(tester: day30.imageName!)
            if keterangan == "tidakada"{
              getAchievement.append(day30.imageName!)
            }else if keterangan == "ada"{
               getAchievement[currentidx] = day30.imageName!
            }
            savebadge.set(getAchievement, forKey: "latestbadge")
        }else if dailycount < 30{
             let day30 = Achievement(title: "30 Day", imageName: "30_days_blur", desc: "", statusBadge: false)
            dataAchievement.append(day30)
        }
        
        if level >= 5{
            let level5 = Achievement(title: "Level 5", imageName: "lvl_5", desc: "", statusBadge: true)
             dataAchievement.append(level5)
            var keterangan = replaceArrayValue(tester: level5.imageName!)
            if keterangan == "tidakada"{
              getAchievement.append(level5.imageName!)
            }else if keterangan == "ada"{
               getAchievement[currentidx] = level5.imageName!
            }
            savebadge.set(getAchievement, forKey: "latestbadge")
        }else if level < 5 {
            let level5 = Achievement(title: "Level 5", imageName: "lvl_5_blur", desc: "", statusBadge: false)
            dataAchievement.append(level5)
        }
        
        if level >= 10{
            let level10 = Achievement(title: "Level 10", imageName: "lvl_10", desc: "", statusBadge: true)
             dataAchievement.append(level10)
            var keterangan = replaceArrayValue(tester: level10.imageName!)
               if keterangan == "tidakada"{
                 getAchievement.append(level10.imageName!)
               }else if keterangan == "ada"{
                  getAchievement[currentidx] = level10.imageName!
               }
            savebadge.set(getAchievement, forKey: "latestbadge")
        }else if level < 10{
            let level10 = Achievement(title: "Level 10", imageName: "lvl_10_blur", desc: "", statusBadge: false)
            dataAchievement.append(level10)
        }
        
        if level >= 20 {
            let level20 = Achievement(title: "Level 20", imageName: "lvl_20", desc: "", statusBadge: true)
            dataAchievement.append(level20)
            var keterangan = replaceArrayValue(tester: level20.imageName!)
            if keterangan == "tidakada"{
              getAchievement.append(level20.imageName!)
            }else if keterangan == "ada"{
               getAchievement[currentidx] = level20.imageName!
            }
            savebadge.set(getAchievement, forKey: "latestbadge")
        }else if level < 20{
            let level20 = Achievement(title: "Level 20", imageName: "lvl_20_blur", desc: "", statusBadge: false)
            dataAchievement.append(level20)
        }
        
        if level >= 50 {
            let level50 = Achievement(title: "Level 50", imageName: "lvl_50", desc: "", statusBadge: true)
            dataAchievement.append(level50)
            var keterangan = replaceArrayValue(tester: level50.imageName!)
            if keterangan == "tidakada"{
              getAchievement.append(level50.imageName!)
            }else if keterangan == "ada"{
               getAchievement[currentidx] = level50.imageName!
            }
            savebadge.set(getAchievement, forKey: "latestbadge")
        }else if level < 50 {
            let level50 = Achievement(title: "Level 50", imageName: "lvl_50_blur", desc: "", statusBadge: false)
            dataAchievement.append(level50)
        }
        
        if level >= 100 {
            let level100 = Achievement(title: "Level 100", imageName: "lvl_100", desc: "", statusBadge: true)
            dataAchievement.append(level100)
            var keterangan = replaceArrayValue(tester: level100.imageName!)
            if keterangan == "tidakada"{
              getAchievement.append(level100.imageName!)
            }else if keterangan == "ada"{
               getAchievement[currentidx] = level100.imageName!
            }
            savebadge.set(getAchievement, forKey: "latestbadge")
        }else if level < 100{
            let level100 = Achievement(title: "Level 100", imageName: "lvl_100_blur", desc: "", statusBadge: false)
            dataAchievement.append(level100)
        }
  
        
        let clear1day = Achievement(title: "Clear 1 Day", imageName: "eat_1d_blur", desc: "", statusBadge: false)
        let clear7day = Achievement(title: "Clear 7 Day", imageName: "eat_7d_blur", desc: "", statusBadge: false)
        let clear30day = Achievement(title: "Clear 30 Day", imageName: "eat_30d_blur", desc: "", statusBadge: false)
      
        dataAchievement.append(clear1day)
        dataAchievement.append(clear7day)
        dataAchievement.append(clear30day)
        //print(getAchievement)
     
     // trigger refresh collection view
     collectionView.reloadData()
    }
    
    func replaceArrayValue(tester: String) -> String  {
        
        currentidx = 0
        var keterangan = ""
        for name in getAchievement{
            if name == tester{
                keterangan = "ada"
                return keterangan
                break
            }
            
            currentidx = currentidx + 1
        }
        keterangan = "tidakada"
        return keterangan
    }
    
    
//    untuk latest achievement-foodventure page
//    func latestachievement(){
//                var pictBadges = ""
//                var latestbadgesArray = [String]()
//                let defaultload = UserDefaults.standard
////                userdefaultnya ini nanti dari array achievement yang udah didapatin.
//                if let badges = defaultload.stringArray(forKey: "latestbadge") as? [String]{
//                    latestbadgesArray = badges
//                    if let tempnameimg = latestbadgesArray.last as? String{
//                        pictBadges = tempnameimg
//                        print(pictBadges)
//                    }
//                }
//    }
 

}

extension AchievementVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: Menentukan jumlah item yang akan di tampilkan
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // MARK: Menghitung jumlah item array dataEmojies
        return dataAchievement.count
    }
    
    // MARK: mengatur view cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "achievementCell", for: indexPath) as! AchievementCell

        // set nilai ke view dalam cell
        let achievement = dataAchievement[indexPath.row]
        cell.achievementLabel.text = achievement.title!
        cell.achievementImage.image = UIImage(named: achievement.imageName!)

        return cell
    }

    // MARK: mengatur layout view cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Lebar & tinggil cell
        return CGSize(width: 100, height: 130)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let achievement = dataAchievement[indexPath.row]
        if achievement.statusBadge == true{
            performSegue(withIdentifier: "detailAchievementSegue", sender: achievement)
            //print(achievement)
            tempImgAchievement = achievement.imageName!
            tempLblAchievement = achievement.title!
        }else{
            let alert = UIAlertController(title: "Achievement Unlock", message: "You can't see the detail of achievement now", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailAchievementSegue"{
            if let destination = segue.destination as? DetailAchievementVC{
                destination.initAchievement(achievement: sender as! Achievement)
            }
            
        }
    }
   
    
}
