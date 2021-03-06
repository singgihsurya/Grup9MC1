//
//  DataViewController.swift
//  Grup9MC1
//
//  Created by Peter Liuwandy on 07/04/20.
//  Copyright © 2020 Singgih Surya Dharma. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var onBoardImageView: UIImageView!
    @IBOutlet weak var onBoardLabel: UILabel!
    @IBOutlet weak var onBoardSkipButton: UIButton!
    @IBOutlet weak var onBoardSubtitle: UILabel!
    
    var displayText: String?
    var displayImage: String?
    var displaySubtitle: String?
    var index: Int?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onBoardImageView.image = UIImage(named: displayImage ?? "")
        onBoardLabel.text = displayText
        onBoardSubtitle.text = displaySubtitle
        // Do any additional setup after loading the view.
    }
    
    
    
   

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
