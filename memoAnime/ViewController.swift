//
//  ViewController.swift
//  memoAnime
//
//  Created by Elisangela dos Santos on 17-09-25.
//  Copyright © 2017 Elisangela dos Santos. All rights reserved.
//
//==================================================
import UIKit
//==================================================

class ViewController: UIViewController {

    @IBOutlet weak var back_01: UIView!
    @IBOutlet weak var front_01: UIView!
    @IBOutlet weak var back_02: UIView!
    @IBOutlet weak var front_02: UIView!
    @IBOutlet weak var back_03: UIView!
    @IBOutlet weak var front_03: UIView!
    @IBOutlet weak var back_04: UIView!
    @IBOutlet weak var front_04: UIView!
    @IBOutlet weak var back_05: UIView!
    @IBOutlet weak var front_05: UIView!
    @IBOutlet weak var back_06: UIView!
    @IBOutlet weak var front_06: UIView!
    @IBOutlet weak var back_07: UIView!
    @IBOutlet weak var front_07: UIView!
    @IBOutlet weak var back_08: UIView!
    @IBOutlet weak var front_08: UIView!
    @IBOutlet weak var back_09: UIView!
    @IBOutlet weak var front_09: UIView!
    @IBOutlet weak var back_10: UIView!
    @IBOutlet weak var front_10: UIView!
    @IBOutlet weak var back_11: UIView!
    @IBOutlet weak var front_11: UIView!
    @IBOutlet weak var back_12: UIView!
    @IBOutlet weak var front_12: UIView!
//--------------------------------------------------
  
    @IBOutlet weak var card_01: UIView!
    @IBOutlet weak var card_02: UIView!
    @IBOutlet weak var card_03: UIView!
    @IBOutlet weak var card_04: UIView!
    @IBOutlet weak var card_05: UIView!
    @IBOutlet weak var card_06: UIView!
    @IBOutlet weak var card_07: UIView!
    @IBOutlet weak var card_08: UIView!
    @IBOutlet weak var card_09: UIView!
    @IBOutlet weak var card_10: UIView!
    @IBOutlet weak var card_11: UIView!
    @IBOutlet weak var card_12: UIView!
    
//--------------------------------------------------
    @IBOutlet weak var img_01: UIImageView!
    @IBOutlet weak var img_02: UIImageView!
    @IBOutlet weak var img_03: UIImageView!
    @IBOutlet weak var img_04: UIImageView!
    @IBOutlet weak var img_05: UIImageView!
    @IBOutlet weak var img_06: UIImageView!
    @IBOutlet weak var img_07: UIImageView!
    @IBOutlet weak var img_08: UIImageView!
    @IBOutlet weak var img_09: UIImageView!
    @IBOutlet weak var img_10: UIImageView!
    @IBOutlet weak var img_11: UIImageView!
    @IBOutlet weak var img_12: UIImageView!
//--------------------------------------------------
    

    //---------------------------------------------------------------
    var arrayOfAnimals: [UIImageView]!
    var arrayOfAnimalNames: [String]!
    var arrayOfRandomAnimals = [String]()
    
    var arrayOfShowingBacks = [UIView]()
    var arrayOfHidingFronts = [UIView]()
    
    var arrayChosenCards = [String]()
    var arrayChosenViews = [UIView]()
    
    //---------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayOfAnimals = [img_01, img_02, img_03, img_04, img_05, img_06, img_07, img_08, img_09, img_10, img_11, img_12]
        arrayOfAnimalNames = ["1.png", "2.png", "3.png","4.png","5.png","6.png","7.png","8.png",
                              "1.png","2.png","3.png","4.png","5.png","6.png","7.png","8.png"]
        
        randomAnimals()
        setImagesToCards()
        
        
    }
    
    //---------------------------------------------------------------
    func flipCard(from: UIView, to: UIView) {
        let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        UIView.transition(with: from, duration: 1.0, options: transitionOptions,animations: {
            from.isHidden = true
        })
        
        UIView.transition(with: to, duration: 1.0, options: transitionOptions,animations: {
            to.isHidden = false
        })
    }
    
    //---------------------------------------------------------------
    func randomAnimals() {
        let numberOfAnimals = arrayOfAnimalNames.count
        for _ in 0..<numberOfAnimals {
            let randomNumber =
                Int(arc4random_uniform(UInt32(arrayOfAnimalNames.count)))
            arrayOfRandomAnimals.append(arrayOfAnimalNames[randomNumber])
            arrayOfAnimalNames.remove(at: randomNumber)
        }
    }
    //---------------------------------------------------------------
    
    func setImagesToCards() {
        var number = 0
        for animal in arrayOfAnimals {
            animal.image = UIImage(named: arrayOfRandomAnimals[number])
            number = number + 1
        }
    }
    
    
    //---------------------------------------------------------------
    
    
    //---------------------------------------------------------------
    
    @objc func reflip() {
        for index in 0..<arrayOfShowingBacks.count {
            flipCard(from: arrayOfShowingBacks[index], to:
                arrayOfHidingFronts[index])
        }
        arrayOfShowingBacks = []
        arrayOfHidingFronts = []
    }
    //---------------------------------------------------------------
    func verification() {
        if arrayChosenCards.count == 2 {
            if arrayChosenCards[0] == arrayChosenCards[1] {
                Timer.scheduledTimer(timeInterval: 2,
                                     target: self,
                                     selector: (#selector(hideCards)),
                                     userInfo: nil,
                                     repeats: false)
            } else {
                arrayChosenViews = []
            }
            arrayChosenCards = []
        }
      //  resetCards()
    }
    //---------------------------------------------------------------
    
    @objc func hideCards() {
        arrayChosenViews[0].isHidden = true
        arrayChosenViews[1].isHidden = true
        arrayChosenViews = []
    }
    //-----------------------
    @IBAction func reset(_ sender: UIButton) {
        card_01.isHidden = false
        card_02.isHidden = false
        card_03.isHidden = false
        card_04.isHidden = false
        card_05.isHidden = false
        card_06.isHidden = false
        card_07.isHidden = false
        card_08.isHidden = false
        card_09.isHidden = false
        card_10.isHidden = false
        card_11.isHidden = false
        card_12.isHidden = false
      
        
        arrayOfAnimalNames = ["1.png", "2.png", "3.png","4.png","5.png","6.png","7.png","8.png",
                              "1.png","2.png","3.png","4.png","5.png","6.png","7.png","8.png"]
        arrayOfRandomAnimals = []
        randomAnimals()
        setImagesToCards()
    }
    //-----------------------
}



