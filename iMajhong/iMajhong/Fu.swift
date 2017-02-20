//
//  Fu.swift
//  iMajhong
//
//  Created by 林东鹏 on 2/20/17.
//  Copyright © 2017 林东鹏. All rights reserved.
//

import Foundation


//http://bbs.csdn.net/topics/100149968

class Fu {
    
    var  JIANG = 0
    
    
    public func isFuPai(seat:SeatItem) -> Bool {
        //   把一副牌放在下面的数组里，可以任意填入数字来测试函数正确与否。
        //   为了方便，PAI[0],PAI[10],PAI[20],PAI[30]都弃之不用，并且必须
        //   置为0，千万注意！
/*
        int   PAI[38]   =   {   0,
            1,1,1,0,1,1,1,0,0,         //   PAI[   1-   9]     壹万～玖万的个数
            0,
            0,0,0,0,0,3,0,0,0,         //   PAI[11-19]     壹铜～玖铜的个数
            0,
            0,0,0,0,0,0,0,0,0,         //   PAI[21-29]     壹条～玖条的个数
            0,
            0,1,1,1,0,0,0                   //   PAI[31-37]     东南西北中发白的个数
        };
 */
        var pai = [Int32](repeating: 0, count: 38)
        var index = 0
        for card in seat.holdCards {
            switch card.type {
            case .East:
                index = 31
            case .West:
                index = 32
            case .South:
                index = 33
            case .North:
                index = 34
            case .Zhong:
                index = 35
            case .Fa:
                index = 36
            case .Baiban:
                index = 37
            case let .Wang(value):
                index = 1+value-1
            case let .Tong(value):
                index = 11+value-1
            case let .Tiao(value):
                index = 21+value-1
            }
            pai[index] += 1
        }
        return fupai(PAI: &pai)
    }
    
    func remain(PAI:[Int32]) -> Int32 {
        var sum:Int32 = 0
        for i in 0..<38 {
            sum += PAI[i]
        }
        return sum
    }
    
    func fupai( PAI:inout [Int32]) -> Bool {
        if remain(PAI: PAI) == 0 {
            return true
        }
        for i in 1..<38 {
            if PAI[i] == 0 {
                continue
            }
            print(PAI[i])
            
            //4张组合
            if PAI[i] == 4 {
                PAI[i] = 0
                if fupai(PAI: &PAI) {
                    return true
                }
                PAI[i] = 4
            }
            
            //3张组合
            if PAI[i] >= 3 {
                PAI[i] -= 3
                if fupai(PAI: &PAI) {
                    return true
                }
                PAI[i] += 3
            }
            
            //2张组合
            if JIANG == 0 && PAI[i] >= 2 {
                JIANG = 1
                PAI[i] -= 2
                if fupai(PAI: &PAI) {
                    return true
                }
                PAI[i] += 2
                JIANG = 0
            }
            
            if i > 30 {
                return false
            }
            
            //   顺牌组合，注意是从前往后组合！   
            if i%10 != 8 && i%10 != 9 && (PAI[i+1] > 0) && (PAI[i+2] > 0) {
                PAI[i] -= 1;
                PAI[i+1] -= 1;
                PAI[i+2] -= 1;
                
                if fupai(PAI: &PAI) {
                    return true
                }
                PAI[i] += 1;
                PAI[i+1] += 1;
                PAI[i+2] += 1;
            }

        }
        //   无法全部组合，不和！
        return false;
    }
}
