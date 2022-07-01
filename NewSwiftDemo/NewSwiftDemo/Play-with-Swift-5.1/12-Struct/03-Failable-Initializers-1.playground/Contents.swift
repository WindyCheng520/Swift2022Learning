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
        
        // 第一种写法，层层嵌套可选型的解包
 
        //swift 2: if let commaIndex = coordinateString.rangeOfString(",")?.startIndex{
        //在Swift3中，API的命名原则被大幅度调整。大多数函数的名字发生了改变。不过使用方法基本相同。
        if let commaIndex = coordinateString.range(of: ",")?.lowerBound{           //swift 3
           
            //if let firstElement = Double(coordinateString.substringToIndex(commaIndex)){      //swift 2
            if let firstElement = Double(coordinateString[..<commaIndex]){                      //swift 3
                
                //if let secondElement = Double(coordinateString.substringFromIndex(commaIndex.successor())){        //swift 2
                if let secondElement = Double(coordinateString[coordinateString.index(after: commaIndex)...]){     //swift 3
                    latitude = firstElement
                    longitude = secondElement
                }
                else{
                    return nil
                }
            }
            else{
                return nil
            }
        }
        else{
            return nil
        }
    }
    
}


let location = Location(coordinateString: "37.3230,-122.0322")
let location2 = Location(coordinateString: "37.3230,-122.0322")!

let location3 = Location(coordinateString: "37.3230&-122.0322")
let location4 = Location(coordinateString: "apple,-122.0322")
let location5 = Location(coordinateString: "37.3230,apple")
let location6 = Location(coordinateString: "Hello, World!")
