//: Playground - noun: a place where people can play

import UIKit


// CustomStringConvertible and BooleanType
struct Record: Equatable, Comparable, CustomStringConvertible/*, BooleanType*/{      //:BooleanType已经被移除
   // SE-0109: Remove the Boolean protocol
    
    var wins: Int
    var losses: Int
    
    var description: String{
        return "WINS: " + String(wins) + " , LOSSES: " + String(losses)
    }
    
    var boolValue: Bool{
        return wins > losses
    }
}
func ==(left: Record, right: Record) -> Bool{
    return left.wins == right.wins && left.losses == right.losses
}
func <(left: Record, right: Record) -> Bool{
    if left.wins != right.wins{
        return left.wins < right.wins
    }
    return left.losses > right.losses
}


let record = Record(wins: 10, losses: 5)

print( record )

//虽然这里没有用到BooleanValue这个协议，但也可以用record.boolValue来进行判断
if record.boolValue{      //swift 3
    print("Great!")
}


// 可以在extension中实现协议！
// 局限：不能使用存储型变量
extension Int/*: BooleanType*/{       //:BooleanType是不是已经被移除了？
    public var boolValue: Bool{
        return self != 0
    }
}

var wins = 0
if !wins.boolValue{
    print("You never win!")
}


// extension of protocol? See you next Chapter!
