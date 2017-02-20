//
//  MJManager.swift
//  iMajhong
//
//  Created by 林东鹏 on 2/16/17.
//  Copyright © 2017 林东鹏. All rights reserved.
//

import Foundation


class MJManager {
    
    var cards = [MajhongItem]()
    
    var seats = [SeatItem]()
    
    var beginIndex = 0
    
    let fu = Fu()
    
    init() {
        
        generalCards()
        generalSeats()
        dispatchCards()
        checkFu()
    }
    
    func generalCards() {
        for _ in 0..<4 {
            for index in 1...9 {
                let card = MajhongItem(mjType: .Wang(value: index))
                cards.append(card)
                let card2 = MajhongItem(mjType: .Tong(value: index))
                cards.append(card2)
                let card3 = MajhongItem(mjType: .Tiao(value: index))
                cards.append(card3)
            }
            let card11 = MajhongItem(mjType: .East)
            cards.append(card11)
            let card12 = MajhongItem(mjType: .West)
            cards.append(card12)
            let card13 = MajhongItem(mjType: .South)
            cards.append(card13)
            let card14 = MajhongItem(mjType: .North)
            cards.append(card14)
            let card15 = MajhongItem(mjType: .Zhong)
            cards.append(card15)
            let card16 = MajhongItem(mjType: .Fa)
            cards.append(card16)
            let card17 = MajhongItem(mjType: .Baiban)
            cards.append(card17)
        }
        
        cards.shuffle()
    }
    
    func generalSeats() {
        let seat1 = SeatItem(sType: .East)
        let seat2 = SeatItem(sType: .West)
        let seat3 = SeatItem(sType: .South)
        let seat4 = SeatItem(sType: .North)
        seats.append(seat1)
        seats.append(seat2)
        seats.append(seat3)
        seats.append(seat4)
    }
    
    func rockDice() -> (UInt32, UInt32) {
        let first = arc4random()%6+1
        let second = arc4random()%6+1
        return (first, second)
    }
    
    func dispatchCards() {
        var position = 0
        for index in 0...63 {
            let card = cards[index]
            let seat = seats[position]
            seat.appendCard(card: card)
            position =  position > 2 ? 0 : position + 1
        }
        
        for seat in seats {
            seat.sortCards()
        }
    }
    
    
    func checkFu() {
        let seat = seats[0]
        seat.holdCards.removeAll()
        
        let card1 = MajhongItem(mjType: .Zhong)
        let card2 = MajhongItem(mjType: .Zhong)
        let card3 = MajhongItem(mjType: .Zhong)
        seat.holdCards.append(card1)
        seat.holdCards.append(card2)
        seat.holdCards.append(card3)
        
        let card4 = MajhongItem(mjType: .Wang(value: 1))
        let card5 = MajhongItem(mjType: .Wang(value: 2))
        let card6 = MajhongItem(mjType: .Wang(value: 3))
        seat.holdCards.append(card4)
        seat.holdCards.append(card5)
        seat.holdCards.append(card6)
        
        let card7 = MajhongItem(mjType: .Wang(value: 4))
        let card8 = MajhongItem(mjType: .Wang(value: 5))
        let card9 = MajhongItem(mjType: .Wang(value: 6))
        seat.holdCards.append(card7)
        seat.holdCards.append(card8)
        seat.holdCards.append(card9)
        
        let card10 = MajhongItem(mjType: .Tiao(value: 4))
        let card11 = MajhongItem(mjType: .Tiao(value: 4))
        let card12 = MajhongItem(mjType: .Tiao(value: 4))
        seat.holdCards.append(card10)
        seat.holdCards.append(card11)
        seat.holdCards.append(card12)
        
        let card13 = MajhongItem(mjType: .Tiao(value: 8))
        seat.holdCards.append(card13)
        let card14 = MajhongItem(mjType: .Tiao(value: 8))
        seat.holdCards.append(card14)
        
        let isfu = fu.isFuPai(seat: seat)
        print("fupai: \(isfu)")
    }
    
}
