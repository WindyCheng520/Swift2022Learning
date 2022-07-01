import UIKit

var x:Int? = 8
var words:String? = nil
var isTrue:Bool? = nil


//可选绑定来解包
if let myNumber = x{
    myNumber + 1
    print(myNumber)
}


//很少用(隐式可选）
var luckNumber:Int! = 8 //隐式可选， 使用时可以自动解包

print(luckNumber ?? "")
let  final = luckNumber + 10 //自动解包（强制解包）
