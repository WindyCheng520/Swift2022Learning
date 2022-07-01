//: Playground - noun: a place where people can play

import UIKit

var skillsOfA: Set<String> = ["swift","OC"]
var skillsOfB: Set<String> = ["HTML","CSS","Javascript"]
var skillsOfC: Set<String> = []


// 用let声明的常量集合不可被修改


// 添加元素
skillsOfC.insert("swift")
skillsOfC.insert("HTML")
skillsOfC.insert("CSS")
// 重复添加元素
skillsOfC.insert("CSS")


// 删除元素
skillsOfC.remove("CSS")
// 删除没有的元素
skillsOfC.remove("Javascript")

if let skill = skillsOfC.remove("HTML"){
    print("HTML is removed.")
}

//if skillsOfC.remove("HTML") != nil{
//    print("HTML is removed.")
//}

//skillsOfC.removeAll()

// 并
skillsOfA.union(skillsOfC)
//skillsOfA.unionInPlace(skilsOfC)    //swift 2
skillsOfA.formUnion(skillsOfC)        //swift 3


// 交

//skillsOfA.intersect(skillsOfC)          //swift 2
skillsOfA.intersection(skillsOfC)         //swift 3
//skillsOfA.intersectInPlace(skillsOfC)   //swift 2
skillsOfA.formIntersection(skillsOfC)     //swift 3


// 减
//skillsOfA.subtract(skillsOfC)             //swift 2 这里在swift3中等同subtractInPlace
skillsOfA.subtracting(skillsOfC)            //swift 3 这个才是swift2中subtract的真正方法
//skillsOfA.subtractInPlace(skillsOfC)      //swift 2
skillsOfA.subtract(skillsOfC)               //swift 3 这个的意思等同于subtractInPlace, 不要搞混


// 异或
//skillsOfA.exclusiveOr(skillsOfC)            //swift 2
skillsOfA.symmetricDifference(skillsOfC)      //swift 3
//skillsOfA.exclusiveOrInPlace(skillsOfC)
skillsOfA.formSymmetricDifference(skillsOfC)  //swift 3


// 操作对象可以是数组
skillsOfA.union(["java","android"])


skillsOfA
skillsOfB
skillsOfC
var skillsOfD: Set = ["swift"]

// 子集


// 在Swift3中，API的命名原则被大幅度调整。大多数函数的名字发生了改变。不过使用方法基本相同。
//方法名中的Of被挪到了参数里面
// swift2:    isSubsetOf()
// swift3:    isSubset(of: )

//skillsOfD.isSubsetOf(skillsOfA)           //swift 2
skillsOfD.isSubset(of: skillsOfA)           //swift 3
//skillsOfD.isStrictSubsetOf(skillsOfA)     //swift 2
skillsOfD.isStrictSubset(of: skillsOfA)     //swift 3

// 超集
//skillsOfA.isSupersetOf(skillsOfD)         //swift 2
skillsOfA.isSuperset(of: skillsOfD)         //swift 3
//skillsOfA.isStrictSupersetOf(skillsOfD)   //swift 2
skillsOfA.isStrictSuperset(of: skillsOfD)   //swift 3

// 判断相离
//skillsOfA.isDisjointWith(skillsOfB)       //swift 2
skillsOfA.isDisjoint(with: skillsOfB)       //swift 3
//skillsOfA.isDisjointWith(skillsOfC)       //swift 2
skillsOfA.isDisjoint(with: skillsOfC)       //swift 3


