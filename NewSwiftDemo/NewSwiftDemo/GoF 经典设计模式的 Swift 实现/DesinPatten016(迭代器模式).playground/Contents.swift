import UIKit

//Iterator 迭代器模式
//迭代器就像回转寿司，保证每一道菜品都能得到展示。

//官方定义
//
//提供一种方法顺序访问一个聚合对象中各个元素, 而又无须暴露该对象的内部表示。
//
//迭代器就是能用hasNext和Next来遍历的一种集合元素。
//
//他很像责任链，但是责任链是一个随时可断的链条（有可能在某一个节点不再把责任下放），他不强调一次完整的遍历。迭代器更像一次次的循环，每次循环都强调完整性，所以更适合集合的场景。
//
//还有一个区别是迭代器是提供元素，而责任链在每一个经手人那做业务。

protocol AbstractIterator {
    func hasNext() -> Bool
    func next() -> Int?
}

class ConcreteIterator: AbstractIterator {
    private var currentIndex = 0
    var elements = [Int]()


    func next() -> Int? {
        guard currentIndex < elements.count else { currentIndex = 0; return nil }
        defer { currentIndex += 1 }
        return elements[currentIndex]
    }

    func hasNext() -> Bool {
        guard currentIndex < elements.count else { currentIndex = 0; return false }
        return elements[currentIndex] != nil
    }
}

protocol AbstractCollection {
    func makeIterator() -> AbstractIterator
}

class ConcreteCollection: AbstractCollection {
    let iterator = ConcreteIterator()
    func add(_ e: Int) {
        iterator.elements.append(e)
    }
    func makeIterator() -> AbstractIterator {
        return iterator
    }
}

let c = ConcreteCollection()
c.add(1)
c.add(2)
c.add(3)

let iterator = c.makeIterator()
while iterator.hasNext() {
    print(iterator.next() as Any)
}





//dmeo2
import Foundation

//定义了一个算法，利用迭代器后，会依次输出结果
struct Algorithm {
    var index: Int
}

//定义了该算法的迭代器
struct AlgorithmIterator: IteratorProtocol {

    private var current = 1
    var begin: Int

    init(begin: Int) {
        self.begin = begin
    }
    mutating func next() -> Algorithm? {
        defer {
            current += 1
        }
        return Algorithm(index: current * begin)
    }
}

//扩展了该算法，增加一个迭代器方法
extension Algorithm: Sequence {
    func makeIterator() -> AlgorithmIterator {
        return AlgorithmIterator(begin: index)
    }
}

let algorithm = Algorithm(index: 10)
var iterator1 = algorithm.makeIterator()
for _ in 1...10 {
print((iterator1.next()?.index)!)
}
/*打印结果：
10
20
30
40
50
60
70
80
90
100
*/
