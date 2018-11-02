//
//  concentration.swift
//  concentration
//
//  Created by Weijie Xiang on 26/10/18.
//  Copyright © 2018 Weijie Xiang. All rights reserved.
//

import Foundation

class Concentration
{
    
    // * init 的方法：加上括号
    // * 甚至不用导入
    var cards = [Card]()
    
    // 已经有一个面朝上，那个是。。。
    // get and set
    // 初始化和刚开始还没有使用这个值得时候，这个只是不存在的，只有当我们需要使用它，或者给他复制的时候才存在
    // 对其进行setd之后，可以进行一些列的全局操作
        var indexOfOneAndOnlyFaceUpCard : Int?
//    var indexOfOneAndOnlyFaceUpCard : Int? {
//        get{
//            var foundIndex: Int?
//            for index in cards.indices{
//                if cards[index].isFaceUp == true{
//                    if foundIndex == nil{
//                        foundIndex = index
//                    }else{
//                        return nil
//                    }
//
//                }
//            }
//            return foundIndex
//        }
//        set{
//            for index in cards.indices{
//                cards[index].isFaceUp = (newValue == index)
//            }
//        }
//    }
    
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            // * 只有意面朝上的时候，看下一个是不是有相同的id
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[index].id == cards[matchIndex].id {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                // * 刚刚开始，或者已经有两个面朝上了
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        
    }
    
    func showCardState(){
        for cardIndex in cards.indices{
            print("===============")
            print(cardIndex)
            print("face status \(cards[cardIndex].isFaceUp)")
            print("match status \(cards[cardIndex].isMatched)")
            
        }
    }
    
    
    // * concentration init
    init(numberOfPairsCard: Int) {
        // * 设置花色
        // * TODO: 看一个每一个card的id生成问题
        // * static 在 struct card 中e的作用到底是什么 ？
        // * 是每次都会改变还是重新生成一个？ 我觉得是重新生成一个
        // * push 两个 id相同的card 到list 里面
        print("the game is with card \(numberOfPairsCard)")
        for _ in 1...numberOfPairsCard{
            let card = Card()
            cards += [card, card]
        }
        
        // TODO: SHAFFLE THE CARD
        
    }
    
}

