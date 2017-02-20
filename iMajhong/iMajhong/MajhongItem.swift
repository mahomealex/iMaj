//
//  MajhongItem.swift
//  iMajhong
//
//  Created by 林东鹏 on 2/16/17.
//  Copyright © 2017 林东鹏. All rights reserved.
//

import Foundation

enum MajhongType {
    case East
    case West
    case South
    case North
    case Zhong
    case Fa
    case Baiban
    case Wang(value:Int)
    case Tong(value:Int)
    case Tiao(value:Int)
}

class MajhongItem {
    
    var type:MajhongType = .East
 
    init(mjType:MajhongType) {
        type = mjType
    }
    
    func sortedValue() -> Int {
        switch type {
        case .East:
            return 10
        case .West:
            return 20
        case .South:
            return 30
        case .North:
            return 40
        case .Zhong:
            return 50
        case .Fa:
            return 60
        case .Baiban:
            return 70
        case let .Wang(value):
            return value+80
        case let .Tong(value):
            return value+90
        case let .Tiao(value):
            return value+100
        }
    }
    
}
