import UIKit
let array = ["1A", "2B", "1C", "2D", "3E", "3F"]

let array1 = ["1A", "2B", "1C", "2D", "3E", "3F"]

let result1 = array1.map{
  print("\($0)")
}


for i in 1...10{
    print("hahahha---\(i)")
}

for i in 1...10 where i % 2 == 0{
    print("hahahha---\(i)")
}

for _ in 1...10{
    print("heihei---")
}


array1.forEach { item in
    
    print(item)
    
}

array1.forEach {
    
    print("\($0)")
    
}


var result:[[String]] = []

array.forEach { item in
    let lastItem = result.last?.last
    if item.first == lastItem?.first{
        var last = result.removeLast()
        last.append(item)
        result.append(last)
    }else{
        result.append([item])
    }
}

print(result)

let dict = ["name": "小明"]

let name = dict["name"]

if name == "小明"{
    print("史晓明")
}

//元组
let someTuple = ("Hello", 3.14, true, ["apple", "banana"])
someTuple.3[0]

var fruitTuple = (red:"apple", yellow:"banana", green:"mango")
fruitTuple.red
fruitTuple.0

var index = 1
while index <= 10{
    print(index)
    index += 2
}



var myCpunter = 12

//即使条件不符合也至少会执行一次
repeat {
    print("just do it \(myCpunter) time")
    myCpunter += 1
}while myCpunter < 11


//let minionImagesFlattened = (1...7).compactMap { UIImage(named: "minionIcon-\($0)") }

//过滤出数
func isPositive(value: Int) -> Bool {
  return value > 0
}
[-4,-2,0,4,7,-8,3].filter(isPositive)


func isMultiple(multiplier: Int) -> ((Int) -> Bool) {
  return { (value: Int) -> Bool in
    value % multiplier == 0
  }
}


//柯里化。柯里化可以将一个接收多个参数的函数转化一个只接收一个参数的函数，同时返回另一个函数（返回的函数将接收原函数的下一个参数，再返回一个函数… 直到所有的参数都被消耗掉，并返回一个最终的值）。这种技术可以让我们实现某个函数的部分功能，这在某些情况下是十分强大和有用的。
//func isMultiple0(multiplier: Int)->(_ value: Int) -> Bool { (value) in
//    return value % multiplier == 0
//}


func isMultiple1(multiplier: Int) -> (_ value: Int) -> Bool {
  return { value in value % multiplier == 0 }
}



func || (lhs:@escaping (Int)->Bool, rhs:@escaping (Int)->Bool) -> ((Int)->Bool) {
  return { (value: Int) -> Bool in
    return lhs(value) || rhs(value)
  }
}

func && (lhs:@escaping (Int)->Bool, rhs:@escaping (Int)->Bool) -> ((Int)->Bool) {
  return { lhs($0) && rhs($0) }
}

prefix func ! (f:@escaping (Int)->Bool) -> ((Int)->Bool) {
  return { value in !f(value) }
}

[-4,-2,0,4,7,-8,3].filter( !isPositive || isMultiple1(multiplier: 3) )

let isZero = { value in value == 0 }
let isPositiveOrZero = isPositive || isZero
let isNegative = !isPositive && !isZero
let isNegativeOrZero = !isPositive
let isEven = isMultiple1(multiplier: 2)
let isOdd = !isEven


[-4,-2,0,4,7,-8,3].filter(isZero)
[-4,-2,0,4,7,-8,3].filter(isPositiveOrZero)
[-4,-2,0,4,7,-8,3].filter(isNegative)
[-4,-2,0,4,7,-8,3].filter(isNegativeOrZero)
[-4,-2,0,4,7,-8,3].filter( isEven)
[-4,-2,0,4,7,-8,3].filter(isOdd)

(3..<array.count).forEach {/*item in*/
    print($0)
}


//今天的目标是用代码处理链接 http://mywebsite.org/customers/:cid/orders/:oid，从中提取出订单号（#oid）和顾客 ID（#cid） 。

enum Request {
    case ProductsList                         // "/products"
    case Product(productID: Int)              // "/products/:pid"
    case CustomersList                        // "/customers"
    case Customer(customerID: Int)            // "/customers/:cid"
    case OrdersList(customerID: Int)          // "/customers/:cid/orders"
    case Order(customerID: Int, orderID: Int) // "/customers/:cid/orders/:oid"
}

//extension Request {
//    init?(path: [String]) {
//        var g = path.generate() // use a generator to build our tuple
//        switch (g.next(), g.next(), g.next(), g.next(), g.next()) {
//        case ("products"?, nil, _, _, _):
//            self = .ProductsList
//        case ("products"?, let spid?, nil, _, _):
//            guard let pid = Int(spid) else { return nil }
//            self = .Product(productID: pid)
//        case ("customers"?, nil, _, _, _):
//            self = .CustomersList
//        case ("customers"?, let scid?, nil, _, _):
//            guard let cid = Int(scid) else { return nil }
//            self = .Customer(customerID: cid)
//        case ("customers"?, let scid?, "orders"?, nil, _):
//            guard let cid = Int(scid) else { return nil }
//            self = .OrdersList(customerID: cid)
//        case ("customers"?, let scid?, "orders"?, let soid?, nil):
//            guard let cid = Int(scid), let oid = Int(soid) else { return nil }
//            self = .Order(customerID: cid, orderID: oid)
//        default: return nil
//        }
//    }
//}

var arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

let squares = arr.map{ $0 * $0 }
squares
let sum = squares.reduce(0, { $0 + $1 })
sum




//下面是一个示范如何将map和flatMap的调用级联起来去做多次转换的例子。我们从一个字符串开始，把它按单词分开，然后依次做如下转换：
//
//统计每个单词的字符个数，做计数
//把每个计数转换成一个相对应的单词
//给每个结果加个后缀
//对每个字符串结果做%转义
//把每个字符串结果转换成一个NSURL

let formatter = NumberFormatter()
formatter.numberStyle = .spellOut
let string = "This is Functional Programming"
let translateURLs = string.split(separator: " ")

let translateURLss = translateURLs.map {
    $0.count
}.compactMap { (n: Int) -> String? in formatter.string(from: NSNumber(value: n)) }
     // add " letters" suffix
    .map { "\($0) letters" }
    // encode the string so it can be used in an NSURL framgment after the # (the stringByAdding… method can return nil)
    .compactMap { $0.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)}
        
    //    stringByAddingPercentEncodingWithAllowedCharacters(.URLFragmentAllowedCharacterSet()) }
    // Build an NSURL using that string (`NSURL(string: …)` is failable: it can return nil)
    .compactMap { URL(string: "https://translate.google.com/#auto/fr/\($0)") }
print(translateURLss)



func combinator(accumulator: Int, current: Int) -> Int {
   return accumulator + current
}
[1, 2, 3].reduce(0, combinator)


//// 重新定义一个 map 函数
func rmap(elements: [Int], transform: (Int) -> Int) -> [Int] {
    // $0 表示第一个传入参数，$1 表示第二个传入参数，依次类推...
    return elements.reduce([Int](), {$0 + [transform($1)]})
}
print(rmap(elements: [1, 2, 3, 4], transform: { $0 * 2}))



//这里 rflatMap 和 rmap 主要差异在于，前者增加了一个 guard 表达式确保可选类型始终有值（换言之，摒弃那些 nil 的情况）。
func rflatMap(elements: [Int], transform: (Int) -> Int?) -> [Int] {
    return elements.reduce([Int](),{ guard let m = transform($1) else { return $0 }
          return $0 + [m]})
}
print(rflatMap(elements: [1, 3, 4], transform: { guard $0 != 3 else { return nil }; return $0 * 2}))
// [2, 8]


func rFilter(elements: [Int], filter: (Int) -> Bool) -> [Int] {
    return elements.reduce([Int](),
                           { guard filter($1) else { return $0 }
          return $0 + [$1]})
}
print(rFilter(elements: [1, 3, 4, 6], filter: { $0 % 2 == 0}))
// [4, 6]


// 初始值 initial 为 0，每次遍历数组元素，执行 + 操作
[0, 1, 2, 3, 4].reduce(0, +)
// 10


// $0 指累加器（accumulator），$1 指遍历数组得到的一个元素（反转数组）
 let array00 = [1, 2, 3, 4, 5].reduce([Int](), { [$1] + $0 })
array00
// 5, 4, 3, 2, 1



//链式调用会有性能损耗
let array01 = [0, 1, 2, 3, 4].map({ $0 + 3}).filter({ $0 % 2 == 0}).reduce(0, +)
array01

//等价于一次reduce，效率性能更高
// 这里只需要遍历 1 次序列足矣
let array02 = [0, 1, 2, 3, 4].reduce(0, { (ac: Int, r: Int) -> Int in
   if (r + 3) % 2 == 0 {
     return ac + r + 3
   } else {
     return ac
   }
})

array02


// 初始值为 Int.max，传入闭包为 min：求两个数的最小值
// min 闭包传入两个参数：1. 初始值 2. 遍历列表时的当前元素
// 倘若当前元素小于初始值，初始值就会替换成当前元素
// 示意写法： initial = min(initial, elem)
[1, 5, 2, 9, 4].reduce(Int.max, min)

[1, 5, 2, 9, 4].min()//效率更高



//剔除重复元素（用Set效率更高)
[1, 2, 5, 1, 7].reduce([], { (a: [Int], b: Int) -> [Int] in
if a.contains(b) {
   return a
} else {
   return a + [b]
}
})

