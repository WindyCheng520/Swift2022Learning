import UIKit

//Chain of responsibility 责任链模式
//责任链模式就像去取钱，每一面值都参与了计算和职责传递。

//官方定义
//
//避免请求发送者与接收者耦合在一起，让多个对象都有可能接收请求，将这些对象连接成一条链，并且沿着这条链传递请求，直到有对象处理它为止。
//
//UIKit的touch事件就应用了责任链模式
//
//这个模式的实现就是既实现一个接口，又组合这个接口，这样自己执行完毕后就可以调用下一个执行者。

protocol ChainTouchable {
    var next: ChainTouchable? { get }
    func touch()
}

class ViewA: ChainTouchable {
    var next: ChainTouchable? = ViewB()
    func touch() {
        next?.touch()
    }
}

class ViewB: ChainTouchable {
    var next: ChainTouchable? = ViewC()
    func touch() {
        next?.touch()
    }
}

class ViewC: ChainTouchable {
    var next: ChainTouchable? = nil
    func touch() {
        print("C")
    }
}

let a = ViewA()
a.touch() // OUTPUT: C



//demo2
import Foundation

//问题协议
protocol QuestionProtocol {
//指定自己回答不出来，下一个回答的人
    var next: QuestionProtocol? {get set}
//该方法用于问问题
    func answerQuestion(question: String)
}

struct Student: QuestionProtocol {
    var name: String
    var canAnswerQuestion: String
    var next: QuestionProtocol?
    func answerQuestion(question: String) {
        switch question {
        case canAnswerQuestion:
            print("\(name)回答：1+1=2")
        case canAnswerQuestion:
            print("\(name)回答：1*2=2")
        case canAnswerQuestion:
            print("\(name)回答：2*2=4")
        case canAnswerQuestion:
            print("\(name)回答：3*2=6")
        default:
            if let next = next {
                next.answerQuestion(question: question)
            }else {
                print("这个问题没人知道答案！")
            }
        }
    }
}



let stu1 = Student(name: "小明", canAnswerQuestion: "1+1", next: nil)
let stu2 = Student(name: "小黄", canAnswerQuestion: "1*2", next: stu1)
let stu3 = Student(name: "小芳", canAnswerQuestion: "2*2", next: stu2)
let stu4 = Student(name: "小辉", canAnswerQuestion: "3*2", next: stu3)

//从4开始，自动依次调用，直到有人回答或者都没人回答结束
stu4.answerQuestion(question: "3*2")//小辉回答：1+1=2
stu4.answerQuestion(question: "2*2")//小芳回答：1+1=2
stu4.answerQuestion(question: "1*2")//小黄回答：1+1=2
stu4.answerQuestion(question: "1+1")//小明回答：1+1=2
stu4.answerQuestion(question: "3*3")//这个问题没人知道答案！

