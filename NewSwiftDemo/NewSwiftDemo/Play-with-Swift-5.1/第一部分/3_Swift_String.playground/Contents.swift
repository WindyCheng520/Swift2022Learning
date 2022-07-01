import UIKit

var str:String = "Hello, playground"
str = ""
//通过构造方法来进行str变量的构造
str = String()              //构造空字符串      ""
str = String("hello")       //通过字符串构造     "hello"
str = String(666)           //通过整型数据构造    "666"
str = String(6.66)          //通过浮点型数据构造  "6.66"
str = String("a")           //通过字符构造       "a"
str = String(false)         //通过Bool值构造     "false"
str = String(describing: (1,1.0,true))  //通过元组构造       "(1,1.0,true)"
str = String(describing: [1, 2, 3])     //通过列表构造       "[1, 2, 3]"
str = String(format:"我是%@","珲少") //通过格式化字符串构造 "我是珲少"
str = String(describing: Int.self)           //通过类型来构造字符串 "Int"

var a = Int(1.05)     //将1.05 转成1
var b = Float(a)      //通过整型数据a构造浮点型数据b

//字符串的组合
var c1 = "Hello"
var c2 = "World"
var c3 = c1+" "+c2  //"Hello World"
//使用\()进行字符串插值
var d = "Hello \(123)"      //"Hello 123"
var d2 = "Hello \(c2)"      //"Hello World"
var d3 = "Hello \(1+2)"      //"Hello3"

MemoryLayout<String>.size // 16
MemoryLayout<Character>.size // 16

//创建一个字符
var e:Character = "a"
//创建字符数组
var e2 : [Character] = ["H","E","L","L","O"]
//通过字符数组来构造字符串 "HELLO"
var e3 = String(e2)
//通过构造方法来创建字符类型变量
var e4 = Character("a")
//进行for-in遍历
let name = "China"
for character in name {
    print(character)
}
//使用unicode码来创建字符  21为!
"\u{21}"

//判断字符串是否为空
var obj1 = ""
if obj1.isEmpty {
    print("字符串为空字符串")
}
//获取字符串中字符个数
obj1.count

var com1 = "30a"
var com2 = "31a"
//比较两个字符串是否相等 只有两个字符串中的所有位置的字符都相等时 才为相等的字符串
com1==com2
//比较两个字符串的大小
com1<com2


var string = "Hello-Swift"
//获取字符串首个字符的下标  0位置
var startIndex = string.startIndex
//获取最后一个字符的下标  11位置
var endIndex = string.endIndex
//获取某个下标后一个下标对应的字符 char="e"
var char = string[string.index(after: startIndex)]
//获取某个下标前一个下标对应的字符 char2 = "t"
var char2 = string[string.index(before: string.endIndex)]
//通过范围获取字符串中的一个子串 Hello
var subString = string[startIndex...string.index(startIndex, offsetBy: 4)]
var subString2 = string[string.index(endIndex, offsetBy: -5)..<endIndex]
//追加一个字符 此时 string = "Hello-Swfit!"
string.append(Character("!"))
//获取某个子串在父串中的范围
var range = string.range(of: "Hello")
//追加字符串操作 此时string = "Hello-Swift! Hello-World"
string.append(" Hello-World")
//在指定位置插入一个字符 此时string = "Hello-Swift!~ Hello-World"
string.insert("~", at: string.index(string.startIndex, offsetBy: 12))
//在指定位置插入一组字符 此时string = "Hello-Swift!~~~~ Hello-World"
string.insert(contentsOf: ["~","~","~"], at: string.index(string.startIndex, offsetBy: 12))
//在指定范围替换一个字符串 此时string = "Hi-Swift!~~~~ Hello-World"
string.replaceSubrange(string.startIndex...string.index(string.startIndex, offsetBy: 4), with: "Hi")
//在指定位置删除一个字符 此时string = "Hi-Swift!~~~~ Hello-Worl"
string.remove(at: string.index(before:string.endIndex))
//删除指定范围的字符 此时string = "Swift!~~~~ Hello-Worl"
string.removeSubrange(string.startIndex...string.index(string.startIndex, offsetBy: 2))
//删除所有字符  此时string = ""
string.removeAll()

var string2 = "My name is Jaki"
//全部转换为大写
string2 = string2.uppercased()
//全部转换为小写
string2 = string2.lowercased()
//检查字符串是否有My前缀
string2.hasPrefix("My")
//检查字符串是否有jaki后缀
string2.hasSuffix("jaki")


//章节练习
/*
 1.分别创建字符串变量China和MyLove，将这两个变量拼接成为一句话并且对拼接后的新字符串变量进行遍历，并检查其中是否有L字符，有则进行打印操作。
 */
var str1 = "China"
var str2 = String("MyLove")
var str3 = str1 + str2
for chara in str3 {
    if chara == "L" {
        print(chara)
    }
}
/*
 2.删除下面字符串中的所有“!”和“?”符号
 swsvr!vrfe?123321!!你好!世界？
 */
var stringOri2 =  "swsvr!vrfe?123321!!你好?世界!"
//创建一个空字符串用于进行接收
var stringRes2 = String()
for index in stringOri2.indices {
    if stringOri2[index] != "?" && stringOri2[index] != "!" {
        stringRes2.append(stringOri2[index])
    }
}
print(stringRes2)
/*
 3.将字符串abcdefg进行倒序排列
 */
var stringOri3 = "abcdefg"
var index3 = stringOri3.endIndex
var stringRes3 = String()
while index3>stringOri3.startIndex {
    index3 = stringOri3.index(before: index3)
    stringRes3.append(stringOri3[index3])
}
print(stringRes3)
/*
 4.将”*“符号逐个插入下面字符串的字符中间
 我爱你中国
 */
var stringOri4 = "我爱你中国"
var stringRes4 = String()
for index in stringOri4.indices {
    stringRes4.append(stringOri4[index])
    if index<stringOri4.index(before: stringOri4.endIndex) {
        stringRes4.append(Character("*"))
    }
}
print(stringRes4)
/*
 5.将下面字符串中所有的abc替换成Hello
 abc中国abc美国abc英国~德国abc法国abc
 */
var stringOri5 = "abc中国abc美国abc英国~德国abc法国abc"
var range5 = stringOri5.range(of:"abc")
while range5 != nil {
    stringOri5.replaceSubrange(range5!, with: "Hello")
    range5 = stringOri5.range(of:"abc")
}
print(stringOri5)
/*
 6.进行正负号翻转 
 将 -123 转换为+123
 将 +456 转换为-456
 */
var stringOri6 = "-123"
stringOri6.count
var stringOri_6 = "+456"
if stringOri6.hasPrefix("-"){
    stringOri6.replaceSubrange(stringOri6.startIndex..<stringOri6.index(after: startIndex), with: "+")
}
if stringOri_6.hasPrefix("+"){
    stringOri_6.replaceSubrange(stringOri_6.startIndex..<stringOri_6.index(after: startIndex), with: "-")
}
print(stringOri6,stringOri_6)


