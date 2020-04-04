//
//  AchievementViewController.swift
//  Grup9MC1
//
//  Created by Singgih Surya Dharma on 04/04/20.
//  Copyright © 2020 Singgih Surya Dharma. All rights reserved.
//

import UIKit

var dataAchievementDailyLogin = [BadgesDailyLogin]()
var dataAchievementPunctual = [BadgesPunctual]()

class AchievementViewController: UIViewController{

    @IBOutlet weak var collectionViewDailyLogin: UICollectionView!
    @IBOutlet weak var collectionViewPunctual: UICollectionView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
        collectionViewDailyLogin.delegate = self
        collectionViewDailyLogin.dataSource = self
        collectionViewPunctual.delegate = self
        collectionViewPunctual.dataSource = self
        initDataDailyLogin()
        initDataPunctual()
           //Do any additional setup after loading the view.
       }
    func initDataPunctual(){
        let awal = BadgesPunctual(title: "Angry", imageName: "Char1Red")
        let tengah = BadgesPunctual(title: "Angry", imageName: "Char1Red")
        let akhir = BadgesPunctual(title: "Angry", imageName: "Char1Red")
        
        dataAchievementPunctual.append(awal)
        dataAchievementPunctual.append(tengah)
        dataAchievementPunctual.append(akhir)
        
        collectionViewPunctual.reloadData()
    }
    
    func initDataDailyLogin() {
        let angry = BadgesDailyLogin(title: "Angry", imageName: "Char1Yellow")
        let bored = BadgesDailyLogin(title: "Angry", imageName: "Char1Yellow")
        let confused = BadgesDailyLogin(title: "Angry", imageName: "Char1Yellow")
      
        dataAchievementDailyLogin.append(angry)
        dataAchievementDailyLogin.append(bored)
        dataAchievementDailyLogin.append(confused)
   
        collectionViewDailyLogin.reloadData()
    }

}
extension AchievementViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: Menentukan jumlah item yang akan di tampilkan
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // MARK: Menghitung jumlah item array dataEmojies
        var n = 0
        if collectionView == self.collectionViewDailyLogin{
            n =  dataAchievementDailyLogin.count
        }else if collectionView == self.collectionViewPunctual{
            n = dataAchievementPunctual.count
        }
        return n
    }
    
    // MARK: mengatur view cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionViewDailyLogin{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "viewCellAchievementDailyLogin", for: indexPath) as! AchievementCollectionViewCell

            // set nilai ke view dalam cell
            let badgesDailyLogin = dataAchievementDailyLogin[indexPath.row]
            cell.labelBadgesDailyLogin.text = badgesDailyLogin.title!
            cell.imageBadgesDailyLogin.image = UIImage(named: badgesDailyLogin.imageName!)

            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "viewCellAchievementPunctual", for: indexPath) as! AchievementCollectionViewCell

            // set nilai ke view dalam cell
            let badgesPunctual = dataAchievementPunctual[indexPath.row]
            cell.labelBadgesPunctual.text = badgesPunctual.title!
            cell.imageBadgesPunctual.image = UIImage(named: badgesPunctual.imageName!)
            return cell
        }
      
    }

    // MARK: mengatur layout view cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Lebar & tinggil cell
        return CGSize(width: 90, height: 150)
    }
}
