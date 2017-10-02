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
    
    @IBOutlet weak var resetGame: UIView!
    @IBOutlet weak var imgfront_01: UIImageView!
    @IBOutlet weak var button_01: UIButton!
    //--------------------------------------------------
    var arrayOfAnimals: [UIImageView]!
    var arrayOfAnimalNames: [String]!
    var arrayOfRandomAnimals = [String]()
    
    var arrayOfShowingBacks = [UIView]()
    var arrayOfHidingFronts = [UIView]()
    
    var arrayChosenCards = [String]()
    var arrayChosenViews = [UIView]()
    
    var arrayOfStyleView: [AnyObject]!
    
    var qtdCards = 0;
    
    //---------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayOfAnimals = [img_01, img_02, img_03, img_04, img_05, img_06, img_07, img_08, img_09, img_10, img_11, img_12]
        arrayOfAnimalNames = ["1.png", "2.png", "3.png","4.png","5.png","6.png",
                              "1.png","2.png","3.png","4.png","5.png","6.png"]
        
        arrayOfStyleView = [back_01, back_02, back_03, back_04, back_05, back_06, back_07, back_08,
                            back_09, back_10, back_11, back_12, img_01, img_02, img_03, img_04, img_05,
                            img_06, img_07, img_08, img_09, img_10, img_11, img_12]
        
        randomAnimals()
        setImagesToCards()
        borderRadius(radius: 10.0)
   
    }
    //---------------------------------------------------------------
    func borderRadius(radius: CGFloat){
        for obj in arrayOfStyleView {
             obj.layer.cornerRadius = radius
             obj.layer.borderWidth = 1.0
             obj.layer.borderColor = UIColor(red: 127/255, green: 180/255, blue: 57/255, alpha: 1.0).cgColor
        }
        
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
    
    @IBAction func ShowCards(_ sender: UIButton) {
        
        if arrayOfHidingFronts.count == 2 {
            return
        }
        switch sender.tag {
        case 0:
            flipCard(from: front_01, to: back_01)
            arrayOfShowingBacks.append(back_01)
            arrayOfHidingFronts.append(front_01)
            arrayChosenCards.append(arrayOfRandomAnimals[0])
            arrayChosenViews.append(card_01)
        case 1:
            flipCard(from: front_02, to: back_02)
            arrayOfShowingBacks.append(back_02)
            arrayOfHidingFronts.append(front_02)
            arrayChosenCards.append(arrayOfRandomAnimals[1])
            arrayChosenViews.append(card_02)
        case 2:
            flipCard(from: front_03, to: back_03)
            arrayOfShowingBacks.append(back_03)
            arrayOfHidingFronts.append(front_03)
            arrayChosenCards.append(arrayOfRandomAnimals[2])
            arrayChosenViews.append(card_03)
        case 3:
            flipCard(from: front_04, to: back_04)
            arrayOfShowingBacks.append(back_04)
            arrayOfHidingFronts.append(front_04)
            arrayChosenCards.append(arrayOfRandomAnimals[3])
            arrayChosenViews.append(card_04)
        case 4:
            flipCard(from: front_05, to: back_05)
            arrayOfShowingBacks.append(back_05)
            arrayOfHidingFronts.append(front_05)
            arrayChosenCards.append(arrayOfRandomAnimals[4])
            arrayChosenViews.append(card_05)
        case 5:
            flipCard(from: front_06, to: back_06)
            arrayOfShowingBacks.append(back_06)
            arrayOfHidingFronts.append(front_06)
            arrayChosenCards.append(arrayOfRandomAnimals[5])
            arrayChosenViews.append(card_06)
        case 6:
            flipCard(from: front_07, to: back_07)
            arrayOfShowingBacks.append(back_07)
            arrayOfHidingFronts.append(front_07)
            arrayChosenCards.append(arrayOfRandomAnimals[6])
            arrayChosenViews.append(card_07)
        case 7:
            flipCard(from: front_08, to: back_08)
            arrayOfShowingBacks.append(back_08)
            arrayOfHidingFronts.append(front_08)
            arrayChosenCards.append(arrayOfRandomAnimals[7])
            arrayChosenViews.append(card_08)
        case 8:
            flipCard(from: front_09, to: back_09)
            arrayOfShowingBacks.append(back_09)
            arrayOfHidingFronts.append(front_09)
            arrayChosenCards.append(arrayOfRandomAnimals[8])
            arrayChosenViews.append(card_09)
        case 9:
            flipCard(from: front_10, to: back_10)
            arrayOfShowingBacks.append(back_10)
            arrayOfHidingFronts.append(front_10)
            arrayChosenCards.append(arrayOfRandomAnimals[9])
            arrayChosenViews.append(card_10)
        case 10:
            flipCard(from: front_11, to: back_11)
            arrayOfShowingBacks.append(back_11)
            arrayOfHidingFronts.append(front_11)
            arrayChosenCards.append(arrayOfRandomAnimals[10])
            arrayChosenViews.append(card_11)
        case 11:
            flipCard(from: front_12, to: back_12)
            arrayOfShowingBacks.append(back_12)
            arrayOfHidingFronts.append(front_12)
            arrayChosenCards.append(arrayOfRandomAnimals[11])
            arrayChosenViews.append(card_12)
            
        default:
            break
        }

        verification()
        buttonreset()
    }
    
    //---------------------------------------------------------------
    func buttonreset() {
        if qtdCards == 6 {
            Timer.scheduledTimer(timeInterval: 3,
                                 target: self,
                                 selector: (#selector(hideCardsReload)),
                                 userInfo: nil,
                                 repeats: false)
            
        }
        
    }
    
    //---------------------------------------------------------------
    func resetCards() {
        if arrayOfShowingBacks.count == 2 {
            Timer.scheduledTimer(timeInterval: 2,
                                 target: self,
                                 selector: (#selector(reflip)),
                                 userInfo: nil,
                                 repeats: false)
        }
    }
    
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
                qtdCards = qtdCards + 1
            
            } else {
                arrayChosenViews = []
            }
            arrayChosenCards = []
        }
        
        resetCards()
    }
    //---------------------------------------------------------------
    
    @objc func hideCards() {
       
        arrayChosenViews[0].isHidden = true
        arrayChosenViews[1].isHidden = true
        arrayChosenViews = []

    }
    //-------------------------
    @objc func refaire() {
      
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
        arrayOfAnimalNames = ["1.png", "2.png", "3.png","4.png","5.png","6.png",
                              "1.png","2.png","3.png","4.png","5.png","6.png"]
        arrayOfRandomAnimals = []
        
        randomAnimals()
        setImagesToCards()
    }
     //-----------------------
    @objc func hideCardsReload() {
      
        resetGame.isHidden=false
    }
    
   //-----------------------
    
    
    @IBAction func resetButton(_ sender: UIButton) {
    
        Timer.scheduledTimer(timeInterval: 1,
                             target: self,
                             selector: (#selector(refaire)),
                             userInfo: nil,
                             repeats: false)
        
        resetGame.isHidden=true
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
        
        
        arrayOfAnimalNames = ["1.png", "2.png", "3.png","4.png","5.png","6.png","1.png","2.png","3.png","4.png","5.png","6.png"]
        arrayOfRandomAnimals = []
          
        randomAnimals()
        setImagesToCards()
        qtdCards = 0;
      
    }
    //-----------------------
}



