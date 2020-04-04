//
//  AchievementViewController.swift
//  Grup9MC1
//
//  Created by Singgih Surya Dharma on 04/04/20.
//  Copyright © 2020 Singgih Surya Dharma. All rights reserved.
//

import UIKit

var dataAchievement = [Emoji]()

class AchievementViewController: UIViewController{

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        initDataEmoji()
           //Do any additional setup after loading the view.
       }
    
    func initDataEmoji() {
        let angry = Emoji(title: "Angry", imageName: "Char1Yellow")
        let bored = Emoji(title: "Angry", imageName: "Char1Yellow")
        let confused = Emoji(title: "Angry", imageName: "Char1Yellow")
      
        dataAchievement.append(angry)
        dataAchievement.append(bored)
        dataAchievement.append(confused)
        
        
        collectionView.reloadData()
        print("x")
    }

}
extension AchievementViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: Menentukan jumlah item yang akan di tampilkan
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // MARK: Menghitung jumlah item array dataEmojies
        return dataAchievement.count
    }
    
    // MARK: mengatur view cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "viewCellAchievement", for: indexPath) as! AchievementCollectionViewCell

        // set nilai ke view dalam cell
        let emoji = dataAchievement[indexPath.row]
        cell.labelBadges.text = emoji.title!
        cell.imageBadges.image = UIImage(named: emoji.imageName!)

        return cell
    }

    // MARK: mengatur layout view cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Lebar & tinggil cell
        return CGSize(width: 100, height: 120)
    }
}
