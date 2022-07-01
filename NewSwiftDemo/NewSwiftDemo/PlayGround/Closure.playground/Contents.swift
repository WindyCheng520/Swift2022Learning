import UIKit
//没有名字的函式

let closeSure = {
    print("hello")
}

closeSure()


let eatClosure = {
    (foodName: String) in
    print("I want to eat \(foodName)")
}

eatClosure("Apple Pie")

let addClosure = {
    (number1:Int, number2:Int) ->Int in
    let result = number1 + number2
    return result
}



//简写
let addClosure1:(Int, Int) ->Int = { return $0 + $1}

addClosure1(100, 555)



addClosure(3, 5)


//闭包类型
let  mutiplyClosure:(Int, Int) ->String = {
    
    (number1:Int, number2:Int) ->String in
    return "\(number1) * \(number2) = \(number1 * number2)"
    
}

mutiplyClosure(9, 9)


//韩式返回值为闭包
func giveMeMultiply() ->(Int, Int) -> String{
    return mutiplyClosure
}

let doMultiply = giveMeMultiply()

doMultiply(7, 9)

let numberArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

let numberArrayAddTen = numberArray.map( { (number: Int) in
    return number + 10
})

numberArrayAddTen

let numberArrayToString = numberArray.map( { (number: Int) -> String in
    return "This is number \(number)"
})

numberArrayToString


//ruturn 也可以省略
let numberArrayToString1 = numberArray.map( {
    return "This is number \($0)"
})

numberArrayToString1


//闭包式最后一个参数可以省略为，ruturn 也可以省略
let numberArrayToString2 = numberArray.map(){
    return "This is number \($0)"
}
numberArrayToString2



//闭包式是唯一各参数参数可以省略掉小括号
let numberArrayToString3 = numberArray.map{ "This is number \($0)"
}
numberArrayToString3


let enentNumber = numberArray.filter( {
    (number: Int) -> Bool in
    return number % 2 == 0
})


enentNumber


let enentNumber1 = numberArray.filter{  $0 % 2 == 0
}


enentNumber1


let enentNumber2 = numberArray.filter{  $0 > 5
}

enentNumber2

//Swift 5.0 中flatMap可以将数组扁平化，实现数组降维，例如：
let results = [[2,5,7], [4,8], [1,10,3]]

//1.flatMap应用于序列并返回一个序列:
let allResults = results.flatMap { $0 }
print("\(allResults)")
//[2, 5, 7, 4, 8, 1, 10, 3]

//可以将数组进行二次过滤:
let filters = results.flatMap { $0.filter { $0 > 5} }
print("\(filters)")
//[7, 8, 10]


//2.flatMap应用于可选类型：
//如果原始的值是nil然后flatMap返回nil：
let input: Int? = Int("10")
let opres: Int? = input.flatMap { $0 > 5 ? $0 : nil }
print("\(String(describing: opres))")


//3.序列可选类型，Swift 4.1之前可以使用flatMap，现在需要compactMap：
let names: [String?] = ["Fly", nil, "Elephant", nil, "FlyElephant"]
let valid = names.compactMap { $0 }
print("\(valid)")



let words = ["53", "FlyElephant", "hello","0"]
let values = words.compactMap { Int($0) }
print("\(values)")

//一般情况下map与flatMap的功能是相似的，都可以执行map工作。
//compactMap的改变是在于将flatMap处理non-optional序列类型，compact处理optional类型。



let prices = [20,30,40]
let sum = prices.reduce(0) { $0 + $1 }
print(sum)


let sum1 = [2, 3, 4].reduce(0, +)          // Output: 9
let sum2 = [5.5, 10.7, 9.43].reduce(0, +)  // Output: 44.435
let sum3 = ["a","b","c"].reduce("", +)     // Output: "abc"




enum Gender {
    case male
    case female
}

struct Student {
    let id: String
    let name: String
    let gender: Gender
    let age: Int
}


let students = [
    Student(id: "991", name: "Jessica", gender: .female, age: 20),
    Student(id: "992", name: "James", gender: .male, age: 25),
    Student(id: "993", name: "Mary", gender: .female, age: 19),
    Student(id: "994", name: "Edwin", gender: .male, age: 27),
    Student(id: "995", name: "Stacy", gender: .female, age: 18),
    Student(id: "996", name: "Emma", gender: .female, age: 22),
]




let genderCount = students.reduce(into: [Gender: Int]()) { result, student in
    
    guard var count = result[student.gender] else {
        // Set initial value to `result`
        result[student.gender] = 1
        return
    }
    
    // Increase counter by 1
    count += 1
    result[student.gender] = count
}

let femaleCount = genderCount[.female]! // Output: 4
let maleCount = genderCount[.male]!     // Output: 2
