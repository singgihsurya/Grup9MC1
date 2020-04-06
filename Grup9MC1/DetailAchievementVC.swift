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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        achievementLabel.text = achievementlbl
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var achievementImage: UIImageView!
    @IBOutlet weak var achievementLabel: UILabel!
    

   

}
