//: Playground - noun: a place where people can play

import UIKit



//swift 3中，inout关键字放在了冒号后面（参数类型的前面）。这样做能使整体看起来更舒服：冒号前面都是名字，冒号后面都是和传入参数类型等有关的内容
func changeScores(scores: inout [Int] , by changeScore: (Int)->Int ){      //swift 3
    
    for (index,score) in scores.enumerated(){      //swift 3
        
        scores[index] = changeScore(score)
    }
}


func changeScore1( score: Int ) -> Int{
    
    return Int(sqrt(Double(score))*10)
}

func changeScore2( score: Int ) -> Int{
    
    return Int( Double(score) / 150.0 * 100.0 )
}


var scores1 = [36,61,78,89,99]
changeScores(scores: &scores1, by: changeScore1)   //swift 3

var scores2 = [88,101,124,137,150]
changeScores(scores: &scores2, by: changeScore2)   //swift 3


func changeScore3( score: Int ) -> Int{
    
    return score + 3
}

var scores3 = [59,61,76,83,95]
changeScores(scores: &scores3, by: changeScore3)   //swift 3
