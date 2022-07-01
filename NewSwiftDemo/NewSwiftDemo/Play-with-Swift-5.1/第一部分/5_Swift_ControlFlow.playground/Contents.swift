import UIKit
//将打印1，2，3，4，5
for index in 1...5 {
    print(index)
}
//如果不需要获取循环中每次的循环次数 可以使用如下方式
var sum=0;
for _ in 1...3 {
    sum += 1
}
//遍历集合类型
var collection1:Array = [1,2,3,4]
var collection2:Dictionary = [1:1,2:2,3:4,4:4]
var collection3:Set = [1,2,3,4]
for obj in collection1 {
    print(obj)
}
for (key , value) in collection2 {
    print(key,value)
}
for obj in collection3 {
    print(obj)
}
var j=0
//先进行一次操作 在判断循环条件
repeat {
    print("repeat while")
    j+=1
} while j<10

var c = 10
//进行if条件判断
if c<10 {
    print(c)
}
//进行if-else组合
if c>10 {
    c-=10
    print(c)
}else{
    print(c)
}
//进行if-else多分支组合
if c>0&&c<10 {
    print(c)
}else if c<=0 {
    c = -c
    print(c)
}else if c<=10&&c<20{
    c-=10
    print(c)
}else{
    print("bigger")
}

var charac:Character = "b"
//使用switch语句进行字符分支判断
switch charac {
case "a":
    print("chara is a")
case "b":
    print("chara is b")
case "c":
    print("chara is c")
default ://default用于处理其他额外情况
    print("no charac")
}
//同一个case中可以包含多个分支
switch charac {
case "a","b","c" :
    print("chara is word")
case "1","2","3" :
    print("chara is num")
default :
    print("no charac")
}
//在case中也可以使用一个范围
var num = 3
switch num {
case 1...3 :
    print("1<=num<=3")
case 4 :
    print("chara is num")
default :
    print("no charac")
}

//使用Switch语句进行元组的匹配
var tuple = (0,0)
//进行数据绑定
switch tuple {
    //对元组中的第一个元素进行捕获
case (let a,1):
    print(a)
case (let b,0):
    print(b)
    //捕获元组中的两个元素 let(a,b) 与 (let a,let b)意义相同
case let(a,b):
    print(a,b)
default:
    print("")
}

switch tuple {
//进行完全匹配
case (0,1):
    print("Sure")
//进行选择性匹配
case (_,1):
    print("Sim")
//进行元组元素的范围匹配
case(0...3,0...3):
    print("SIM")
default:
    print("")
}


//对于进行了数据捕获的Switch-case结构 可以使用where关键字来进行条件判断
switch tuple {
case (let a,1):
    print(a)
    //当元组中的两个元素都等于0时才匹配成功，并且捕获第一个元素的值
case (let b,0) where b==0:
    print(b)
//当元组中的两个元素相同时 才会进入下面的case
case let(a,b) where a==b:
    print(a,b)
default:
    print("")
}


for index in 0...9 {
    if  index == 6 {
        continue
    }
    print("第\(index)此循环")
}

MyLabel:for indexI in 0...2 {
    for indexJ in 0...2 {
        if indexI == 1 {
            continue MyLabel
        }
        print("第\(indexI)\(indexJ)此循环")
    }
}

for index in 0...9 {
    if  index == 6 {
        break
        
    }
    print("第\(index)此循环")
}
MyLabel:for indexI in 0...2 {
    for indexJ in 0...2 {
        if indexI == 1 {
            break MyLabel
        }
        print("第\(indexI)\(indexJ)此循环")
    }
}


switch tuple {
case (0,0):
    print("Sure")
    //fallthrough会继续执行下面的case
    fallthrough
case (_,0):
    print("Sim")
    fallthrough
case(0...3,0...3):
    print("SIM")
default:
    print("")
}
//有返回值函数的返回
func myFunc()->Int{
    return 0
}
//无返回值函数的返回
func myFunc(){
    return
}
//定义异常类型
enum MyError:Error {
    case errorOne
    case errorTwo
}
func  newFunc() throws{
    //抛出异常
    throw MyError.errorOne
}

func myFuncTwo(param:Int)  {
    guard param>0 else {
        return
    }
    print("其他操作")
}

/*
 1．打印出所有的“水仙花数”，所谓“水仙花数”是指一个三位数，其各位数字立方和等于该数本身。
 */
for item in 100...999 {
    //获取各位数字
    let dig = item%10
    //获取十位数字
    let tens = item/10%10
    //获取百位数字
    let hundred = item/100
    //获取结果
    let sum = dig*dig*dig + tens*tens*tens + hundred*hundred*hundred
    if sum == item {
        print(item)
    }
}
/*
 2.猴子吃桃问题：猴子第一天摘下若干个桃子，当即吃了一半，还不过瘾，又多吃了一个，第二天早上又将剩下的桃子吃掉一半，又多吃了一个。以后每天早上都吃了前一天剩下的一半零一个。到第10天早上想再吃时，见只剩下一个桃子了。求第一天共摘了多少。
 */
var count = 1;
for _ in 1...9 {
    count = (count+1)*2
}
print(count)
/*
 3.两个乒乓球队进行比赛，各出三人。甲队为p1,p2,p3三人，乙队为q1,q2,q3三人。已抽签决定比赛名单。有人向队员打听比赛的名单。p1说他不和q1比，p3说他不和q1,q3比，请编程序找出三队赛手的名单。
 */
//标识甲队
var p1 = 1
var p2 = 2
var p3 = 3
//标识乙队
var q1 = 0
var q2 = 0
var q3 = 0
for indexI in 1...3 {
    q1 = indexI
    for indexJ in 1...3 {
        q2 = indexJ
        for indexK in 1...3 {
            q3 = indexK
            if indexI != indexJ && indexI != indexK && indexJ != indexK {
                if q1 != p1 && p3 != q1 && p3 != q3 {
                    print(q1,q2,q3)
                }
            }
        }
    }
}
/*
 4.求1+2!+3!+...+20!的和
 */
var sumC = 0;
for var index in 1...20 {
    var tmp = 1;
    while index > 0{
        tmp *= index
        index -= 1
    }
    sumC+=tmp
}
print(sumC)

/*
 5.打印倒金字塔
 * * * * * * *
   * * * * *
     * * *
       *
 */

for indexI in 1...4 {
    for indexJ in 1...7 {
        if indexJ < indexI{
            //先打因左侧空格
            print(" ", separator: "", terminator: "")
        }else if indexJ+(indexI-1)<=7 {
            //再打印*
            print("*",separator: "",terminator: "")
        }
    }
    //换行
    print("")
}


