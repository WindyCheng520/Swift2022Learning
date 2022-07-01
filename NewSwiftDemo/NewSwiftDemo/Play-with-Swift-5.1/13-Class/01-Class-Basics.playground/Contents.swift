//: Playground - noun: a place where people can play

import UIKit

class Person{
    
    var firstName: String
    var lastName: String
    
    // 如果没有初值，Class不提供默认的构造函数！
    init(firstName: String, lastName: String){
        
        self.firstName = firstName
        self.lastName = lastName
    }
    
    init?(fullName: String){
        
        guard let spaceIndex = fullName.range(of: " ")?.lowerBound  
            //swift 2: let spaceIndex = fullName.rangeOfString(" ")?.startIndex
            //在Swift3中，API的命名原则被大幅度调整。大多数函数的名字发生了改变。不过使用方法基本相同。
                   //swift 3
        else{
            return nil
        }

        self.firstName = String(fullName[...spaceIndex])                            //swift 4
        self.lastName = String(fullName[fullName.index(after: spaceIndex)...])      //swift 4
    }
    
    func fullName() -> String{
        
        return firstName + " " + lastName
    }
}


let person1 = Person(firstName: "Alexander", lastName: "Hamilton")
person1.fullName()

let person2 = Person(fullName: "Steve Jobs")
