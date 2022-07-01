//
//  Common.swift
//  DYZB
//
//  Created by 1 on 16/9/14.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit

let kStatusBarH : CGFloat = 20
let kNavigationBarH : CGFloat = 44
let kTabbarH : CGFloat = 44

let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height

/// 全局外观渲染颜色
let kAppearanceTintColor =  UIColor.orange

// MARK: -全局函数，可直接使用

/// 延迟 在主线程执行函数
func delay(delata: Double, callFunc: @escaping ()->()) {
    DispatchQueue.main.asyncAfter(deadline:  DispatchTime.init(uptimeNanoseconds: NSEC_PER_SEC * UInt64(delata)), execute: callFunc)
}


//
//public let π = CGFloat(Double.pi) // 不建议
//public let τ = π * 2.0 // 不建议
//public func halt() { // 不建议
//    PlaygroundPage.current.finishExecution()
//}
//extension CGFloat {
//    /// 存放 π 常量，建议
//    public static let (pi, π) = (CGFloat(Double.pi), CGFloat(Double.pi))
// 
//    /// 存放 τ 常量，建议
//    public static let (tau, τ) = (2 * pi, 2 * pi)
//}
//extension PlaygroundPage {
//    // 这看起来好看不少
//    public static func halt() {
//        current.finishExecution()
//    }
//}

