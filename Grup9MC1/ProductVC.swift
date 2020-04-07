//
//  ProductVC.swift
//  Grup9MC1
//
//  Created by Singgih Surya Dharma on 06/04/20.
//  Copyright © 2020 Singgih Surya Dharma. All rights reserved.
//

import UIKit
private let reuseIdentifier = "productCell"
class ProductVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var ProVC: UICollectionView!
    
    
    
}
extension ProductVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
     // MARK: Menentukan jumlah item yang akan di tampilkan
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         // MARK: Menghitung jumlah item array dataEmojies
         return 20
     }
     
     // MARK: mengatur view cell
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .blue
        
         return cell
     }
     // MARK: mengatur layout view cell
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         // Lebar & tinggil cell
         return CGSize(width: collectionView.frame.width, height: 120)
     }
}
