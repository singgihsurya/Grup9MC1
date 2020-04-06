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
        // Do any additional setup after loading the view.
    }
    
    func initDataAchievement() {
     let angry = Achievement(title: "angry", imageName: "Char1Red")
     let bored = Achievement(title: "bored", imageName: "Char1Red")
     let confused = Achievement(title: "confused", imageName: "Char1Red")
     
     dataAchievement.append(angry)
     dataAchievement.append(bored)
     dataAchievement.append(confused)
     
     
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
        return CGSize(width: 120, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let achievement = dataAchievement[indexPath.row]
        performSegue(withIdentifier: "detailAchievementSegue", sender: achievement)
        //print(achievement)
        tempImgAchievement = achievement.imageName!
        tempLblAchievement = achievement.title!
        print(tempImgAchievement)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailAchievementSegue"{
            if let destination = segue.destination as? DetailAchievementVC{
                destination.achievementlbl = tempLblAchievement
            }
            
        }
    }
   
    
}
