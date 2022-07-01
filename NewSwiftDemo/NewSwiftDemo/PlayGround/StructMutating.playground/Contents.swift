import UIKit


//使用mutating的时机

//让我们再进一步，通过使用 private setter 阻止了从外部修改 count 变量，从而将潜在危险降到最低：
struct Counter {
    // 将 setter 方法设为私有,
    // 这样只有 increment 函数能够修改它!
    private(set) var count: Int
    
    init(count: Int = 0) {
        self.count = count
    }
    
    // 使用 mutating 关键字来实现修改 count
    mutating func increment() {
        count += 1
    }
}

var counter = Counter()
counter.increment()
