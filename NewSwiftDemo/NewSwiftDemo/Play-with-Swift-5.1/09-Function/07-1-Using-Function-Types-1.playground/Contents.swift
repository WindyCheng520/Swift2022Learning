//: Playground - noun: a place where people can play

import UIKit


//swift 3中，inout关键字放在了冒号后面（参数类型的前面）。这样做能使整体看起来更舒服：冒号前面都是名字，冒号后面都是和传入参数类型等有关的内容
func changeScores1(scores: inout [Int]){       //swift 3
    
    //swift 3不支持在没有显式地声明数据类型的情况下使用[]。如果想创建一个空的NSArray，则需要声明数据类型
    for (index, score) in scores.enumerated(){   //swift 3
        scores[index] = Int(sqrt(Double(score))*10)
    }
}

func changeScores2( scores: inout [Int] ){      //swift 3
    
    for (index,score) in scores.enumerated(){
        scores[index] = Int( Double(score) / 150.0 * 100.0 )
    }
}


var scores1 = [36,61,78,89,99]
changeScores1(scores: &scores1)     //swift 3

var scores2 = [88,101,124,137,150]
changeScores2(scores: &scores2)     //swift 3
