//
//  Counter.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/14.
//

import Foundation

struct Counter {
    private(set) var count: Int
    
    // 依赖注入
    // 计数器的初始值是注入的
    init(count: Int = 0) {
        self.count = count
    }
    
    mutating func scaleBy(multiplier: Int) {
        count = count * multiplier
    }
}
