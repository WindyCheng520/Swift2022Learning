import UIKit



struct Cube {
  var side: Double
       
  // 译者注: 结构体中，定义的方法修改内部定义变量值时，该方法必须添加mutating关键字
  mutating func add(newCube: Cube) {
    self.side += newCube.side
  }
}
var myCube = Cube(side: 10.0)
let foundCube1 = Cube(side: 5.0)
myCube.add(newCube: foundCube1)
print(myCube.side)



//重载运算函数(如上+(lhsCube:rhsCube:)函数)无法在自定义的类或结构体内声明，重载运算符函数只允许在全局作用域下有效！
func + (lhsCube: Cube, rhsCube: Cube) -> Cube {
  var resultCube = Cube(side: 0.0)
  resultCube.side = lhsCube.side + rhsCube.side
  return resultCube
}


let existingCube = Cube(side: 10.0)
let foundCube2 = Cube(side: 20.0)
let newCube = existingCube + foundCube2
print(newCube.side)




//自定义运算符
postfix operator ***
postfix func *** (myCube: inout Cube){
  myCube.side = myCube.side * 3
}
var yourCube = Cube(side: 10.0)
yourCube***
print(yourCube.side)


//prefix operator +++
//postfix func +++ (thisCube: inout Cube){
//    thisCube.side = thisCube.side * 3
//}
//var hisCube = Cube(side: 10.0)
//+++hisCube
//print(hisCube.side)


