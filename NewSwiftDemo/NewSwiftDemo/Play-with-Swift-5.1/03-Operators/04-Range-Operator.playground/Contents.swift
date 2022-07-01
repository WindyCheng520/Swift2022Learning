//: Playground - noun: a place where people can play

import UIKit

for index in 1...10{
    index
    
    // index属于常量，不能再循环体内被修改！
    //index = 3
}

for index in 0..<10{
    index
}

let courses = ["慕课网2048私人定制","CSS3 3D特效","玩儿转swift","绚丽的倒计时效果 Canvas绘图与动画基础","Canvas绘图详解","学写一个字","Canvas玩儿转图像处理","Canvas玩儿转红包照片","玩儿转swift 5.1"]
for i in 0..<courses.count{
    print( courses[i] )
}



//单侧闭合区间右侧
for name in courses[2...] {
    
    print("单侧区间----右侧)")
    print(name)
    print("单侧区间----右侧)")
}

//单侧区闭合间左侧
for name in courses[...2] {
    
    print("单侧区间----左侧侧)")
    print(name)
    print("单侧区间----左侧)")
}

//单侧区半闭合间左侧
for name in courses[..<2] {
    
    print("单侧ban区间----左侧侧)")
    print(name)
    print("单侧ban区间----左侧)")
}

