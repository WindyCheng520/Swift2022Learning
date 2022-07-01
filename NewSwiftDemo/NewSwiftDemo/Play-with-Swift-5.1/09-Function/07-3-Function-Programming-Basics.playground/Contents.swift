//: Playground - noun: a place where people can play

import UIKit



//swift 3中，inout关键字放在了冒号后面（参数类型的前面）。这样做能使整体看起来更舒服：冒号前面都是名字，冒号后面都是和传入参数类型等有关的内容
func changeScores(scores: inout [Int] , by changeScore: (Int)->Int ){     //swift 3
    
    for (index,score) in scores.enumerated(){    //swift 3
        scores[index] = changeScore(score)
    }
}

func changeScore(score: Int) -> Int{
    return Int(sqrt(Double(score))*10)
}


var scores = [65, 91, 45, 97, 87, 72, 33]
changeScores(scores: &scores, by: changeScore)  //swift 3


// map
scores.map(changeScore)

func isPassOrFail(score: Int) -> String{
    return score < 60 ? "Fail" : "Pass"
}
scores.map(isPassOrFail)


// filter
func fail(score: Int) -> Bool{
    return score < 60
}
scores.filter(fail)


// reduce
func add(num1: Int , _ num2: Int) -> Int{
    return num1 + num2
}


// swift 3中，reduce(_:, combine: )的API变成了redice(_:, _:), 也就是所有传入的参数都不需要声明变量名称了

scores.reduce(0, add)   //swift 3
scores.reduce(0, +)

func concatenate( str: String , num: Int ) -> String{
    return str + String(num) + " "
}
scores.reduce("", concatenate)               //swift 3
