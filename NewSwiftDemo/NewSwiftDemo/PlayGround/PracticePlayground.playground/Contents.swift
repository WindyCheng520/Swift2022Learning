//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var dataSource:[Any]  = []

let arr = [1,2]

let arr1 = arr.sorted{$0 > $1}
print(arr1)

arr.first
let arr2 = ["2"]

func test(){
}

dataSource.append(str)

dataSource.append(arr)
dataSource.append(arr2)
dataSource.append(test())

protocol Greetable {
    var name: String { get }
    func greet()
}

struct Person: Greetable {
    let name: String
    func greet() {
        print("你好 \(name)")
    }
}
Person(name: "Wei Wang").greet()


struct Cat: Greetable {
    let name: String
    func greet() {
        print("meow~ \(name)")
    }
}

let array: [Greetable] = [
    Person(name: "Wei Wang"),
    Cat(name: "onevcat")]
for obj in array {
    obj.greet()
}


