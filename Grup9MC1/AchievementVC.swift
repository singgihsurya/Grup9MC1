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
        let day1 = Achievement(title: "1 Day", imageName: "1_days_blur", desc: "anda mendapatkan badge ini ketika pertama kali login", statusBadge: true)
        let day7 = Achievement(title: "7 Day", imageName: "7_days_blur", desc: "", statusBadge: false)
        let day30 = Achievement(title: "30 Day", imageName: "30_days_blur", desc: "", statusBadge: false)

        let level5 = Achievement(title: "Level 5", imageName: "lvl_5_blur", desc: "", statusBadge: false)
        let level10 = Achievement(title: "Level 10", imageName: "lvl_10_blur", desc: "", statusBadge: false)
        let level20 = Achievement(title: "Level 20", imageName: "lvl_20_blur", desc: "", statusBadge: false)
        let level50 = Achievement(title: "Level 50", imageName: "lvl_50_blur", desc: "", statusBadge: false)
        let level100 = Achievement(title: "Level 100", imageName: "lvl_100_blur", desc: "", statusBadge: false)
        
        let clear1day = Achievement(title: "Clear 1 Day", imageName: "eat_1d_blur", desc: "", statusBadge: false)
        let clear7day = Achievement(title: "Clear 7 Day", imageName: "eat_7d_blur", desc: "", statusBadge: false)
        let clear30day = Achievement(title: "Clear 30 Day", imageName: "eat_30d_blur", desc: "", statusBadge: false)
      
        dataAchievement.append(day1)
        dataAchievement.append(day7)
        dataAchievement.append(day30)
        dataAchievement.append(level5)
        dataAchievement.append(level10)
        dataAchievement.append(level20)
        dataAchievement.append(level50)
        dataAchievement.append(level100)
        dataAchievement.append(clear1day)
        dataAchievement.append(clear7day)
        dataAchievement.append(clear30day)
        
     
     // trigger refresh collection view
     collectionView.reloadData()
    }
    
    
//    untuk latest achievement-foodventure page
//    func latestachievement(){
//                var pictBadges = ""
//                var latestbadgesArray = [String]()
//                let defaultload = UserDefaults.standard
//                userdefaultnya ini nanti dari array achievement yang udah didapatin.
//                if let badges = defaultload.stringArray(forKey: "makan") as? [String]{
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
