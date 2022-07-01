//: Playground - noun: a place where people can play

import UIKit


// enum也可以有方法
enum Shape{
    case Square(side: Double)
    case Rectangle(width: Double, height: Double)
    case Circle(centerx: Double, centery: Double, radius: Double)
    case Point
    
    func area() -> Double{
        
        switch self {
        case let .Square(side):
            return side*side
        case let .Rectangle( width , height ):
            return width * height
        case let .Circle( _ , _ , r ):
            //swift3中PI放在了Double类下。这样是不是更方便记忆？
            return .pi*r*r      //swift 3 Double.pi/.pi
        case .Point:
            return 0
        }
    }
}


let square = Shape.Square(side: 10)
let rectangle = Shape.Rectangle(width: 20, height: 30)
let circle = Shape.Circle(centerx: 0, centery: 0, radius: 15)
let point = Shape.Point

square.area()
rectangle.area()
circle.area()
point.area()

