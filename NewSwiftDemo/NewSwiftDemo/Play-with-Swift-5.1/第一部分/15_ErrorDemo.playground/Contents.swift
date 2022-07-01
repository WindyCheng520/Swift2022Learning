//: Playground - noun: a place where people can play

import UIKit

//自定义的异常类型
enum MyError:Error {
    //定义3种程度的异常
    case DesTroyError
    case NormalError
    case SimpleError
}
print("should error")
//进行异常的抛出
//throw MyError.DesTroyError
print("finish")

func MyFunc(param:Bool)throws->Void {
    if param {
        print("success")
    }else{
        throw MyError.NormalError
    }
}
//使用do-catch进行异常的捕获与处理
do{
    //将可能产生异常的代码写在do块中
    try MyFunc(param: false)
//进行异常类型的匹配
}catch MyError.SimpleError{
    print("SimpleError")
}catch MyError.NormalError{
    print("NormalError")
}catch MyError.DesTroyError{
    print("DesTroyError")
//如果前面的异常类型都没有匹配上 会被最后这个catch块捕获到
}catch{
    print("otherError")
}

var tmp = try? MyFunc(param: false)
if tmp == nil{
    print("执行失败")
}else{
    print("执行成功")
}

if let _ = try? MyFunc(param: false) {
    print("success")
}else{
    print("fail")
}

//如果此函数抛出了异常 则会产生运行时错误
try! MyFunc(param: true)


func TemFunc()throws -> Void {
    defer{
        print("finish")
    }
    print("handle")
    //抛出异常
    throw MyError.DesTroyError
}
//调用此函数执行的结果为
/*
 handle
 finish
 */
try TemFunc()

//1.编写一个函数，其功能是输入一个学生分数，打印输出分数所在的成绩等级，60分以下为不及格，60~75分之间为及格，76~90之间为良好，90分以上为优秀。需要注意，分数的取值范围为0~100之间，输入范围之外的分数将抛出异常，需要打印分数无效的提示。
//自定义一个异常类型
enum AchieveError:Error{
    case achieveError
}
func printAchieve(mark:Int)throws{
    if mark<0 {
        throw AchieveError.achieveError
    }else if mark<60{
        print("成绩不及格")
    }else if mark<76{
        print("成绩及格")
    }else if mark<91{
        print("成绩良好")
    }else if mark<101{
        print("成绩优秀")
    }else{
        throw AchieveError.achieveError
    }
}
//调用函数
do{
   try printAchieve(mark: 98)
}catch AchieveError.achieveError{
    print("成绩无效")
}catch{
    print("2121")
}
