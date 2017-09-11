//
//  ViewController.swift
//  SampleCollectionView
//
//  Created by Michael on 11/9/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView.register(UINib(nibName: "SampleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SampleCollectionViewCell")
     
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        
        collectionView.collectionViewLayout = flowLayout
        collectionView.dataSource = self
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.reloadData()
        
    }

}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 100
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SampleCollectionViewCell", for: indexPath) as! SampleCollectionViewCell
        
        cell.textLabel.text = randomString(length: 100)
        cell.subTextLabel.text = randomString(length: 10)
        cell.widthConstraint.constant = collectionView.bounds.width
        
        return cell
        
    }
    
}

extension ViewController {
    
    func randomString(length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
    
}


