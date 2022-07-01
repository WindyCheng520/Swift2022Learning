import UIKit
import RxSwift


//六、监听事件的生命周期
//1，doOn 介绍
//（1）我们可以使用 doOn 方法来监听事件的生命周期，它会在每一次事件发送前被调用。
//（2）同时它和 subscribe 一样，可以通过不同的 block 回调处理不同类型的 event。比如：
//do(onNext:) 方法就是在 subscribe(onNext:) 前调用
//而 do(onCompleted:) 方法则会在 subscribe(onCompleted:) 前面调用。

let observable = Observable.of("A", "B", "C")
 
observable
    .do(onNext: { element in
        print("Intercepted Next：", element)
    }, onError: { error in
        print("Intercepted Error：", error)
    }, onCompleted: {
        print("Intercepted Completed")
    }, onDispose: {
        print("Intercepted Disposed")
    })
    .subscribe(onNext: { element in
        print(element)
    }, onError: { error in
        print(error)
    }, onCompleted: {
        print("completed")
    }, onDisposed: {
        print("disposed")
    })


//七、Observable 的销毁（Dispose）
//1，Observable 从创建到终结流程
//（1）一个 Observable 序列被创建出来后它不会马上就开始被激活从而发出 Event，而是要等到它被某个人订阅了才会激活它。
//（2）而 Observable 序列激活之后要一直等到它发出了 .error 或者 .completed 的 event 后，它才被终结。
//
//2，dispose() 方法
//（1）使用该方法我们可以手动取消一个订阅行为。
//（2）如果我们觉得这个订阅结束了不再需要了，就可以调用 dispose() 方法把这个订阅给销毁掉，防止内存泄漏。
//（2）当一个订阅行为被 dispose 了，那么之后 observable 如果再发出 event，这个已经 dispose 的订阅就收不到消息了。下面是一个简单的使用样例。

let observable2 = Observable.of("A", "B", "C")
//使用subscription常量存储这个订阅方法
let subscription = observable2.subscribe { event in
    print(event)
}
         
//调用这个订阅的dispose()方法
subscription.dispose()



//3，DisposeBag
//（1）除了 dispose() 方法之外，我们更经常用到的是一个叫 DisposeBag 的对象来管理多个订阅行为的销毁：
//我们可以把一个 DisposeBag 对象看成一个垃圾袋，把用过的订阅行为都放进去。
//而这个 DisposeBag 就会在自己快要 dealloc 的时候，对它里面的所有订阅行为都调用 dispose() 方法。
//
//（2）下面是一个简单的使用样例。
let disposeBag = DisposeBag()
         
//第1个Observable，及其订阅
let observable3 = Observable.of("A", "B", "C")
observable3.subscribe { event in
    print(event)
}.disposed(by: disposeBag)
 
//第2个Observable，及其订阅
let observabl3 = Observable.of(1, 2, 3)
observable2.subscribe { event in
    print(event)
}.disposed(by: disposeBag)


