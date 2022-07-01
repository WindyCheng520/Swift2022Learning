import UIKit
import Foundation


//Sequence
class FibonacciGenerator : IteratorProtocol{
    var last = (0,1)
    var endAt:Int
    var lastIteration = 0

    init(end:Int){
        endAt = end
    }

    func next() -> Int?{
        guard lastIteration<endAt else {
            return nil
        }
        lastIteration += 1

        let next = last.0
        last = (last.1,last.0 + last.1)
        return next
    }
}


var fg = FibonacciGenerator(end:10)

while let fib = fg.next() {
    print(fib)
}

//
//class CompactFibonacciSequence : Sequence {
//    var endAt:Int
//
//    init(end:Int){
//        endAt = end
//    }
//
//    func makeIterator() -> AnyGenerator<Int> {
//        var last = (0,1)
//        var lastIteration = 0
//
//        return anyGenerator({
//            guard lastIteration<self.endAt else {
//                return nil
//            }
//            lastIteration++
//
//            let next = last.0
//            last = (last.1,last.0+last.1)
//            return next
//        })
//    }
//}

//单元测试
//https://swift.gg/2016/03/23/unit-testing-swift/
