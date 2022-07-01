import UIKit

func doSomething(){
    print("do someThing")
}

doSomething()

func eat(foodName:String){
    print("eat ---\(foodName)")
}

eat(foodName: "Hamburger")
//
//func add(number1:Int, number2: Int){
//    _ = number1 + number2
//}


func add(number1:Int, number2: Int) ->Int{
    return number1 + number2
}

//add(number1: 1, number2: 2)

let sum = add(number1: 2, number2: 3)
