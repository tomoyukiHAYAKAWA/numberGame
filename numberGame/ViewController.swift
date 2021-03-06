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
    
    var timer: Timer!
    
    var numbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15, 16, 16, 17, 17, 18, 18, 19, 19, 20, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
    
    var getNumArray: [Int] = []
    
    var count = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        label.layer.cornerRadius = 20.0
        lottery.layer.cornerRadius = 20.0
        
    }
    
    @IBAction func resetBtn() {
        numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15, 16, 16, 17, 17, 18, 18, 19, 19, 20, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
        getNumArray.removeAll()
        count = 20
        lottery.isEnabled = true
        countLabel.text = "あと\(count)個"
        label.text = "↓Tap↓"
        collectionView.reloadData()
    }
    
    @IBAction func lotteryBtn() {
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(randomAnime), userInfo: nil, repeats: true)
        
        lottery.isEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            
            self.timer.invalidate()
            self.count = self.count - 1
            self.countLabel.text = "あと\(self.count)個"
            
            let random = Int.random(in: 0..<self.numbers.count)
            self.label.text = String(self.numbers[random])
            
            self.getNumArray.append(self.numbers[random])
            self.numbers.remove(at: random)
            
            self.collectionView.reloadData()
            
            self.lottery.isEnabled = true
            
            if self.count == 0 {
                self.countLabel.text = "終了です！"
                self.lottery.isEnabled = false
            }
            
        }
        
    }
    
    @objc func randomAnime() {
        
        let random = Int.random(in: 0..<self.numbers.count)
        label.text = String(numbers[random])
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getNumArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let label = cell.contentView.viewWithTag(1) as? UILabel {
            label.text = String(getNumArray[indexPath.row])
            label.clipsToBounds = true
            label.layer.cornerRadius = 10.0
        }
        return cell
    }

}

