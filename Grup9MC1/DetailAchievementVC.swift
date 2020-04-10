//
//  DetailAchievementVC.swift
//  Grup9MC1
//
//  Created by Singgih Surya Dharma on 06/04/20.
//  Copyright © 2020 Singgih Surya Dharma. All rights reserved.
//

import UIKit


class DetailAchievementVC: UIViewController {

    var achievementimg = ""
    var achievementlbl = ""
    var achievementdsc = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(achievementlbl)
        achievementLabel.text = achievementlbl
        achievementImage.image = UIImage(named: achievementimg)
        achievementDesc.text = achievementdsc
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var achievementImage: UIImageView!
    @IBOutlet weak var achievementLabel: UILabel!
    @IBOutlet weak var achievementDesc: UILabel!
    
    func initAchievement(achievement: Achievement){
        self.achievementlbl = achievement.title!
        self.achievementimg = achievement.imageName!
        self.achievementdsc = achievement.desc!
    }
    
    
   

}
