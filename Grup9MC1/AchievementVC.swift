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
        let day1 = Achievement(title: "1 Day", imageName: "tes")
        let day7 = Achievement(title: "7 Day", imageName: "7_days_clear")
        let day30 = Achievement(title: "30 Day", imageName: "30_days_clear")

        let level5 = Achievement(title: "Level 5", imageName: "level_5_clear")
        let level10 = Achievement(title: "Level 10", imageName: "level_10_clear")
        let level20 = Achievement(title: "Level 20", imageName: "level_20_clear")
        let level50 = Achievement(title: "Level 50", imageName: "level_50_clear")
        let level100 = Achievement(title: "Level 100", imageName: "level_100_clear")
        
        let clear1day = Achievement(title: "Clear 1 Day", imageName: "makan_1_hari_clear")
        let clear7day = Achievement(title: "Clear 7 Day", imageName: "makan_7_hari_clear")
        let clear30day = Achievement(title: "Clear 30 Day", imageName: "makan_30_hari_clear")
      
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
        return CGSize(width: 110, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let achievement = dataAchievement[indexPath.row]
        performSegue(withIdentifier: "detailAchievementSegue", sender: achievement)
        //print(achievement)
        tempImgAchievement = achievement.imageName!
        tempLblAchievement = achievement.title!
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailAchievementSegue"{
            if let destination = segue.destination as? DetailAchievementVC{
                destination.initAchievement(achievement: sender as! Achievement)
            }
            
        }
    }
   
    
}
