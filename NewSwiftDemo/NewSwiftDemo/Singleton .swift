//
//  Singleton .swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/14.
//

import Foundation


public final class Singleton {
    private static let _shared = Singleton()
    private init() { }
    
    public static var shared: Singleton {
        print("side effects here")
      //  connect() // 举个栗子
        return _shared
    }
}



// 返回 `URL`，同时也可以明确指出错误
public enum SocketEndPoint: String {
    case events = "http://nowhere.com/events"
    case live = "http://nowhere.com/live"
    
    public var url: URL {
        guard let url = URL(string: self.rawValue) else {
            fatalError("Unconstructable URL: \(self.rawValue)")
        }
        return url
    }
}



