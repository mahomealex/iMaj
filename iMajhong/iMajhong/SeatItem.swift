//
//  SeatItem.swift
//  iMajhong
//
//  Created by 林东鹏 on 2/16/17.
//  Copyright © 2017 林东鹏. All rights reserved.
//

import Foundation


enum SeatType {
    case East
    case West
    case South
    case North
}

class SeatItem  {
    
    var type:SeatType = .East
    
    var holdCards = [MajhongItem]()
    var fixCards = [MajhongItem]()//碰。杠存的牌
    
    init(sType:SeatType) {
        type = sType
    }
    
    func appendCard(card:MajhongItem) {
        holdCards.append(card)
    }
    
    
    func sortCards() {
        holdCards.sort { (card1, card2) -> Bool in
            return card1.sortedValue() > card2.sortedValue()
        }
        for card in holdCards {
            print(card.sortedValue())
        }
    }
    
    
}
