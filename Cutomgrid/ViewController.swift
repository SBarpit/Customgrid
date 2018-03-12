//
//  ViewController.swift
//  Cutomgrid
//
//  Created by Appinventiv Mac on 08/03/18.
//  Copyright © 2018 Appinventiv Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    var imageArray = ["1","2","3","4","5","6","7","8","9","10","11","12","1","2"]
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: ViewController methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadMyView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadMyView(){
        collectionView.delegate=self
        collectionView.dataSource=self
        if let layout = collectionView?.collectionViewLayout as? MyLayout {
            layout.delegate = self
        }
    }
    
    
}

//MARK: UICollectionViewDataSource methods

extension ViewController{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
        cell.imageView.image = UIImage(named: imageArray[indexPath.item])
        return cell
    }
}

//MARK: PhotosLayoutDelegate protocol method to set the height of the cel

extension ViewController:PhotosLayoutDelegate{
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return CGFloat(300)
        }else{
            return CGFloat(144)
        }
        
    }
}

