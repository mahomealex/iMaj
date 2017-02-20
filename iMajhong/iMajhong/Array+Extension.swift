//
//  Array+Extension.swift
//  iMajhong
//
//  Created by 林东鹏 on 2/16/17.
//  Copyright © 2017 林东鹏. All rights reserved.
//

import Foundation

extension Array {
    
    public mutating func shuffle() {
        return self.sort(by: { (_, _) -> Bool in
            arc4random() % 2 > 0
        })
    }
}
