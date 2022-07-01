//: Playground - noun: a place where people can play

import UIKit

struct Location{
    
    let latitude: Double
    let longitude: Double
    var placeName: String?

    
    init(latitude: Double, longitude: Double, placeName: String){
        
        self.latitude = latitude
        self.longitude = longitude
        self.placeName = placeName
    }
    
    init(latitude: Double, longitude: Double){
        
        self.latitude = latitude
        self.longitude = longitude
    }
    
    init(){
        latitude = 0.0
        longitude = 0.0
    }
    
    // 使用Failable-Initializer
    init?(coordinateString: String){
        
        
        // 第二种写法，使用guard提高可读性
        //swift 2: guard let commaIndex = coordinateString.rangeOfString(",")?.startIndex else{
        //在Swift3中，API的命名原则被大幅度调整。大多数函数的名字发生了改变。不过使用方法基本相同。
        guard let commaIndex = coordinateString.range(of: ",")?.lowerBound else{          //swift 3/4
            return nil
        }
        
        //guard let firstElement = Double(coordinateString.substringToIndex(commaIndex)) else{   //swift 2
        guard let firstElement = Double(coordinateString[..<commaIndex]) else{                   //swift 4
            return nil
        }
        
        //guard let secondElement = Double(coordinateString.substringFromIndex(commaIndex.successor())) else{        //swift 2
        guard let secondElement = Double(coordinateString[coordinateString.index(after: commaIndex)...])   else{     //swift 4
            return nil
        }
        
        latitude = firstElement
        longitude = secondElement
    }
    
}


let location = Location(coordinateString: "37.3230,-122.0322")
let location2 = Location(coordinateString: "37.3230,-122.0322")!

let location3 = Location(coordinateString: "37.3230&-122.0322")
let location4 = Location(coordinateString: "apple,-122.0322")
let location5 = Location(coordinateString: "37.3230,apple")
let location6 = Location(coordinateString: "Hello, World!")
