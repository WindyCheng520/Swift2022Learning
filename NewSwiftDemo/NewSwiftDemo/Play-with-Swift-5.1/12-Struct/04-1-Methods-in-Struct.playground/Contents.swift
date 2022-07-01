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
    
    init(coordinateString: String){
        
        //swift 2: let commaPos = coordinateString.rangeOfString(",")!.startIndex
        //在Swift3中，API的命名原则被大幅度调整。大多数函数的名字发生了改变。不过使用方法基本相同。
        let commaPos = coordinateString.range(of: ",")!.lowerBound           //swift 3
        //let firstElement = Double(coordinateString.substringToIndex(commaIndex))                    //swift 2
        let firstElement = Double(coordinateString[..<commaPos])                                    //swift 4
        //let secondElement = Double(coordinateString.substringFromIndex(commaIndex.successor()))     //swift 2
        let secondElement = Double(coordinateString[coordinateString.index(after: commaPos)...])    //swift 4
        
        //self.latitude = Double(firstElement)!   //这里我感觉强制解包符应该放在Double里面？
        self.latitude = Double(firstElement!)
        //self.longitude = Double(secondElement)! //同样，是不是应该放里面?
        self.longitude = Double(secondElement!)
    }
    
    func printLocation(){
        print("The Location is \(self.latitude),\(self.longitude)")
    }
    
    func isNorth() -> Bool{
        return self.latitude > 0
    }
    
    func isSouth() -> Bool{
        return !self.isNorth()
    }
    
    // 注意，给出两个地点的经纬度，计算两点之间的距离不是这么计算！
    // 这里只做演示用
    func distanceTo( location: Location ) -> Double{
        
        return sqrt(pow(self.latitude - location.latitude,2) + pow(self.longitude - location.latitude,2))
        
    }
}


let appleHeadQuarterLocation = Location(latitude: 37.3230, longitude: -122.0322)
appleHeadQuarterLocation.printLocation()
appleHeadQuarterLocation.isNorth()
appleHeadQuarterLocation.isSouth()

let googleHeadQuarterLocation = Location(latitude: 37.4220, longitude: -122.0841)

appleHeadQuarterLocation.distanceTo(location: googleHeadQuarterLocation)     //swift 3

