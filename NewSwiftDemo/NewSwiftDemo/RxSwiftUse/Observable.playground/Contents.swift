import UIKit
import RxSwift

//1，Observable<T>
//Observable<T> 这个类就是 Rx 框架的基础，我们可以称它为可观察序列。它的作用就是可以异步地产生一系列的 Event（事件），即一个 Observable<T> 对象会随着时间推移不定期地发出 event(element : T) 这样一个东西。
//而且这些 Event 还可以携带数据，它的泛型 <T> 就是用来指定这个 Event 携带的数据的类型。
//有了可观察序列，我们还需要有一个 Observer（订阅者）来订阅它，这样这个订阅者才能收到 Observable<T> 不时发出的 Event。
//
//原文出自：www.hangge.com  转载请保留原文链接：https://www.hangge.com/blog/cache/detail_1922.html

//3，Observable 与 Sequence比较
//（1）为更好地理解，我们可以把每一个 Observable 的实例想象成于一个 Swift 中的 Sequence：
//即一个 Observable（ObservableType）相当于一个序列 Sequence（SequenceType）。
//ObservableType.subscribe(_:) 方法其实就相当于 SequenceType.generate()
//
//（2）但它们之间还是有许多区别的：
//Swift 中的 SequenceType 是同步的循环，而 Observable 是异步的。
//Observable 对象会在有任何 Event 时候，自动将 Event 作为一个参数通过 ObservableType.subscribe(_:) 发出，并不需要使用 next 方法。





//1，just() 方法
//（1）该方法通过传入一个默认值来初始化。
//（2）下面样例我们显式地标注出了 observable 的类型为 Observable<Int>，即指定了这个 Observable 所发出的事件携带的数据类型必须是 Int 类型的。
let observable = Observable<Int>.just(5)








//2，of() 方法
//（1）该方法可以接受可变数量的参数（必需要是同类型的）
//（2）下面样例中我没有显式地声明出 Observable 的泛型类型，Swift 也会自动推断类型。
let observable1 = Observable.of("A", "B", "C")

//有了 Observable，我们还要使用 subscribe() 方法来订阅它，接收它发出的 Event。
//第一种用法：
//（1）我们使用 subscribe() 订阅了一个 Observable 对象，该方法的 block 的回调参数就是被发出的 event 事件，我们将其直接打印出来。
observable1.subscribe { event in
    print(event)
}
//运行结果如下，可以看到：
//初始化 Observable 序列时设置的默认值都按顺序通过 .next 事件发送出来。
//当 Observable 序列的初始数据都发送完毕，它还会自动发一个 .completed 事件出来。

//（2）如果想要获取到这个事件里的数据，可以通过 event.element 得到。
observable1.subscribe { event in
    print(event.element)
}

//第二种用法：
//（1）RxSwift 还提供了另一个 subscribe 方法，它可以把 event 进行分类：
//通过不同的 block 回调处理不同类型的 event。（其中 onDisposed 表示订阅行为被 dispose 后的回调，这个我后面会说）
//同时会把 event 携带的数据直接解包出来作为参数，方便我们使用。

observable1.subscribe(onNext: { element in
    print(element)
}, onError: { error in
    print(error)
}, onCompleted: {
    print("completed")
}, onDisposed: {
    print("disposed")
})

//（2）subscribe() 方法的 onNext、onError、onCompleted 和 onDisposed 这四个回调 block 参数都是有默认值的，即它们都是可选的。所以我们也可以只处理 onNext 而不管其他的情况。
         
observable1.subscribe(onNext: { element in
    print(element)
})














//3，from() 方法
//（1）该方法需要一个数组参数。
//（2）下面样例中数据里的元素就会被当做这个 Observable 所发出 event 携带的数据内容，最终效果同上面饿 of() 样例是一样的。
let observable2 = Observable.from(["A", "B", "C"])


//4，empty() 方法
//该方法创建一个空内容的 Observable 序列。
let observable3 = Observable<Int>.empty()



//5，never() 方法
//该方法创建一个永远不会发出 Event（也不会终止）的 Observable 序列。

let observable4 = Observable<Int>.never()



//6，error() 方法
//该方法创建一个不做任何操作，而是直接发送一个错误的 Observable 序列。

enum MyError: Error {
    case A
    case B
}
         
let observable5 = Observable<Int>.error(MyError.A)




//7，range() 方法
//（1）该方法通过指定起始和结束数值，创建一个以这个范围内所有值作为初始值的 Observable 序列。
//（2）下面样例中，两种方法创建的 Observable 序列都是一样的。

//使用range()
let observable6 = Observable.range(start: 1, count: 5)
//使用of()
let observable7 = Observable.of(1, 2, 3 ,4 ,5)


//8，repeatElement() 方法
//该方法创建一个可以无限发出给定元素的 Event 的 Observable 序列（永不终止）。
let observable8 = Observable.repeatElement(1)



//9，generate() 方法
//（1）该方法创建一个只有当提供的所有的判断条件都为 true 的时候，才会给出动作的 Observable 序列。
//（2）下面样例中，两种方法创建的 Observable 序列都是一样的。
//使用generate()方法
let observable9 = Observable.generate(
    initialState: 0,
    condition: { $0 <= 10 },
    iterate: { $0 + 2 }
)
 
//使用of()方法
let observable91 = Observable.of(0 , 2 ,4 ,6 ,8 ,10)



//10，create() 方法
//（1）该方法接受一个 block 形式的参数，任务是对每一个过来的订阅进行处理。
//（2）下面是一个简单的样例。为方便演示，这里增加了订阅相关代码（关于订阅我之后会详细介绍的）。
//这个block有一个回调参数observer就是订阅这个Observable对象的订阅者
//当一个订阅者订阅这个Observable对象的时候，就会将订阅者作为参数传入这个block来执行一些内容
let observable10 = Observable<String>.create{observer in
    //对订阅者发出了.next事件，且携带了一个数据"hangge.com"
    observer.onNext("hangge.com")
    //对订阅者发出了.completed事件
    observer.onCompleted()
    //因为一个订阅行为会有一个Disposable类型的返回值，所以在结尾一定要returen一个Disposable
    return Disposables.create()
}
 
//订阅测试
observable10.subscribe {
    print($0)
}



//
//11，deferred() 方法
//（1）该个方法相当于是创建一个 Observable 工厂，通过传入一个 block 来执行延迟 Observable 序列创建的行为，而这个 block 里就是真正的实例化序列对象的地方。
//（2）下面是一个简单的演示样例：
//用于标记是奇数、还是偶数
var isOdd = true
//使用deferred()方法延迟Observable序列的初始化，通过传入的block来实现Observable序列的初始化并且返回。
let factory : Observable<Int> = Observable.deferred {
     
    //让每次执行这个block时候都会让奇、偶数进行交替
    isOdd = !isOdd
     
    //根据isOdd参数，决定创建并返回的是奇数Observable、还是偶数Observable
    if isOdd {
        return Observable.of(1, 3, 5 ,7)
    }else {
        return Observable.of(2, 4, 6, 8)
    }
}
 
//第1次订阅测试
factory.subscribe { event in
    print("\(isOdd)", event)
}
 
//第2次订阅测试
factory.subscribe { event in
    print("\(isOdd)", event)
}



//12，interval() 方法
//（1）这个方法创建的 Observable 序列每隔一段设定的时间，会发出一个索引数的元素。而且它会一直发送下去。
//（2）下面方法让其每 1 秒发送一次，并且是在主线程（MainScheduler）发送。

let observable12 = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
observable12.subscribe { event in
    print(event)
}



//13，timer() 方法
//（1）这个方法有两种用法，一种是创建的 Observable 序列在经过设定的一段时间后，产生唯一的一个元素。
//5秒种后发出唯一的一个元素0
let observable13 = Observable<Int>.timer(.seconds(5), scheduler: MainScheduler.instance)
observable13.subscribe { event in
    print(event)
}


//（2）另一种是创建的 Observable 序列在经过设定的一段时间后，每隔一段时间产生一个元素。
//延时5秒种后，每隔1秒钟发出一个元素
let observable131 = Observable<Int>.timer(.seconds(5), period: .seconds(1), scheduler: MainScheduler.instance)
observable.subscribe { event in
    print(event)
}
