//
//  ViewController.swift
//  concentration
//
//  Created by Weijie Xiang on 24/10/18.
//  Copyright © 2018 Weijie Xiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    var flipCount: Int = 0 {
        didSet{
            filpTimes.text = "filps: \(flipCount)"
        }
    }
    
    @IBOutlet var buttonCollection: [UIButton]!
    
    var numberOfCardPairs: Int{
        get{
            return (buttonCollection.count+1) / 2
        }
    }
    // MA: 开始初始化的时候，等待button collection 完成之后再进行初始化game
    lazy var game: Concentration = Concentration(numberOfPairsCard: numberOfCardPairs)
    
    @IBOutlet weak var filpTimes: UILabel!
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        // * button clicked
        if let indexCard = buttonCollection.index(of: sender){
            // * 点击了一张卡片，更新状态，然后根据更新的状态来反转
            game.chooseCard(at: indexCard)
            updateViewFromModel()
            flipCount += 1
        }else{
            print("the card is not in the collections")
        }
        
    }
    
    func updateViewFromModel(){
        game.showCardState()
        for index in buttonCollection.indices{
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
            }else{
                button.setTitle("", for: UIControl.State.normal)
            }
            if card.isMatched{
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            }
            
            
            
        }
        
    }
    
    // MARK: TEST
    
    var emoji = [Int: String]();
    var emojiChoice = ["😀", "👻", "🎃", "😈"]
    
    func emoji(for card: Card) -> String{
        if emoji[card.id] == nil, emojiChoice.count>0{
            let randomIndex = Int(arc4random_uniform(UInt32(emoji.count)));
            // * remove ar: return currently removed one, and change the list
            print(emojiChoice)
            emoji[card.id] = emojiChoice.remove(at: randomIndex)
        }
        // * used for checking whether the emoji[id] is exist ?
        print(emoji)
        return emoji[card.id] ?? "?"
    }
    
}

