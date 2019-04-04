//
//  ViewController.swift
//  numberGame
//
//  Created by Tomoyuki Hayakawa on 2019/04/03.
//  Copyright © 2019 Tomoyuki Hayakawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet var label: UILabel!
    @IBOutlet var countLabel: UILabel!
    @IBOutlet weak var lottery: UIButton!
    
    
    var numbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15, 16, 16, 17, 17, 18, 18, 19, 19, 20, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
    
    var getNumArray: [Int] = []
    
    var count = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        
    }
    
    @IBAction func resetBtn() {
        numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15, 16, 16, 17, 17, 18, 18, 19, 19, 20, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
        getNumArray.removeAll()
        count = 20
        lottery.isEnabled = true
        countLabel.text = "あと\(count)個"
        label.text = ""
        collectionView.reloadData()
    }
    
    @IBAction func lotteryBtn() {
        
        count = count - 1
        countLabel.text = "あと\(count)個"
        
        let random = Int.random(in: 0..<numbers.count)
        label.text = String(numbers[random])
        
        getNumArray.append(numbers[random])
        numbers.remove(at: random)
        
        collectionView.reloadData()
        
        if count == 0 {
            countLabel.text = "終了です！"
            lottery.isEnabled = false
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getNumArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let label = cell.contentView.viewWithTag(1) as? UILabel {
            label.text = String(getNumArray[indexPath.row])
        }
        return cell
    }

}

