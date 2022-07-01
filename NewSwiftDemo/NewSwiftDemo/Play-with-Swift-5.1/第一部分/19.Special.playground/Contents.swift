import UIKit
//容器协议
protocol Container {
    //约束item 泛型为 Int类型
    associatedtype Item where Item == Int
    func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
class MyIntArray: Container {
    //这个地方必须指定为Int否则会报错
    typealias Item = Int
    func append(_ item: Int) {
        self.innerArray.append(item)
    }
    var count: Int{
        get{
            return self.innerArray.count
        }
    }
    subscript(i: Int) -> Int {
        return self.innerArray[i]
    }
    var innerArray = [Int]()
}

// 多行字符串
var multiLineString = """
abcd
jaki
24
"""
print(multiLineString)

var string1 = "这里有一个双引号\""
var string2 = #"这里有一个双引号""#
/*
 1
 2
 3
 */
var string3 = #"""
1\#n2\#n3\#n
"""#

let array = ["1","2","3"]
for item in array[0...]{
    print(item)
}
