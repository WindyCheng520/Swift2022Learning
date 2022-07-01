//: Playground - noun: a place where people can play

import UIKit


var str = "Hello, playground"

struct Foo {
    static var x = "Advanced"
    var xBuzz: String {
        didSet {
            Foo.x = oldValue
            print("\(Foo.x)")
        }
    }
}

var obj = Foo(xBuzz: "Swift")
obj.xBuzz = "OC"





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
        
        // 第三种写法，在guard中并列解包
        guard
            //swift 2: let commaIndex = coordinateString.rangeOfString(",")?.startIndex
            //在Swift3中，API的命名原则被大幅度调整。大多数函数的名字发生了改变。不过使用方法基本相同。
            let commaIndex = coordinateString.range(of: ",")?.lowerBound,                                  //swift 3/4
            //let firstElement = Double(coordinateString.substringToIndex(commaIndex))                    //swift 2
            let firstElement = Double(coordinateString[..<commaIndex]),                                    //swift 4
            //let secondElement = Double(coordinateString.substringFromIndex(commaIndex.successor()))     //swift 2
            let secondElement = Double(coordinateString[coordinateString.index(after: commaIndex)...])    //swift 4
        else{
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


// 回忆一下，我们之前也曾使用过Failable Initializer
let a = Int("2")
let b = Int("liuyubobobo")
