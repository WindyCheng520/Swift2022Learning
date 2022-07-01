import UIKit

//字符串赋值
var str = "Hello, playground"
//整型赋值
var count = 5
//元组赋值
var group = (1,2,"12")
// 进行解构赋值
var (n1, n2, n3) = (1, 2, 3)
print(n1, n2 ,n3) // 1, 2, 3
//Bool赋值
var bol = true
//相加运算
1+2
//相减运算
2-1
//相乘运算
2*2
//相除运算
4/2
//取余运算
4%3

var a = 1
var b = -2
+b //-2
-a //-1
var value1 = 10%3 //余数1
var value2 = -10%3 //余数-1

var tmp=1
//加赋值复合运算
tmp+=3  //tmp = tmp +3
//减赋值复合运算
tmp-=3  //tmp = tmp -3
//乘赋值复合运算
tmp*=3  //tmp = tmp *3
//除赋值复合运算
tmp/=3  //tmp = tmp /3
//取余赋值复合运算
tmp%=3  //tmp = tmp %3


var p1 = true
var p2 = false
//与运算 false
p1&&p2
//或运算 true
p1||p2
//非运算 false
!p1

1==2 //等于比较         返回false
1<2  //小于比较         返回true
1>2  //大于比较         返回false
1 != 2 //不等于比较     返回true
1<=2  //小于等于比较    返回true
1>=2  //大于等于比较    返回false


var tp1 = (3,4,"5")
var tp2 = (2,6,"9")
var tp3 = ("1",4,5)
tp1<tp2             //将返回false

var m = 3
var n = 6
print(m>n ? "m>n":"m<=n")
if m>n {
    print("m>n")
}else{
    print("m<=n")
}
//空合并运算符
var q:Int? = 8
var value:Int
value = q ?? 0
value = (q != nil) ? (q!) : 0

if q != nil {
    value = q!
}else{
    value = 0
}

//创建范围 >=0 且<=10 的闭区间
var range1 = 0...10
//创建范围>=0 且<10 的半开区间
var range2 = 0..<10

//a...b为闭区间写法
for index in 0...3 {
    print(index)
}
//a..<b为左闭右开区间
for index in 0..<3 {
    print(index)
}
//数字是否包含在某个范围中
if range1 ~= 8 {
    print("range1包含8")
}

//章节练习
/*
 1.	将下列描述翻译成Swift表达式。
 小李买了5支铅笔、1块橡皮、3本作业本和11个书签。每支铅笔2元，每块橡皮3元，每本作业本2.5元，每个书签0.5元，计算小李所花多少钱。
 */
//共26元
var tip =  11 * 0.5
var book = 3 * 2.5
var sum = 5 * 2 + 1 * 3 + tip + book
/*
 2.设计一个表达式来生成1~7之间的一个随机数。
 */
//random()为Swift标准函数库中的随机数生成函数
//swift3.0中删除了random()函数 使用arc4random()
var rand = arc4random()%7+1


/*
 3.语数外3门科目进行测试，当3门科目的成绩都大于60且总分不小于200分时，成绩才为合格，使用Swift表达式来描述上述逻辑。
 */
var Language=60
var Math=65
var English=70
if Language>60 && Math>60 && English>60 && (Language+Math+English)>200 {
    print("合格")
}
/*
 4.编写闰年判断的表达式。
	闰年：1.能够被400整除。
         2.能过被4整除但是不能够被100整除。
 */
var year = 2016
if year%400==0 || ((year%4==0) && (year%100 != 0)) {
    print("闰年")
}
/*
 5.学校乒乓球比赛需要每班出一名主选手和一名辅助选手参赛，比赛分为上下两场，上半场主选手得分超过30，则下半场需要辅助选手进行，否则下半场依然由主选手进行，使用条件运算符描述下半场比赛出赛的选手。
 */
var mark = 40
var people = mark>30 ? "主选手" : "辅助选手"

/*
 6.打印如下图案：
 **********
 *????????*
 *????????*
 **********
 */
//有四行图案
for indexH in 1...4 {
    //每行有10列符号
    print("")
    for indexV in 1...10 {
        //第一行和最后一行为纯*
        if indexH==1 || indexH==4 {
            print("*", separator: "", terminator: "")
        }else{
            //第一列和最后一列为*
            if indexV==1 || indexV==10 {
                print("*", separator: "", terminator: "")
            }else{
                //其余为?
                print("?",separator: "",terminator: "")
            }
        }
    }
}


