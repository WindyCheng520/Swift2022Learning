import UIKit


//泛型demo
class Stack<T:Equatable> {
  private var stackItems: [T] = []
  func pushItem(item:T) {
      stackItems.append(item)
  }
  func popItem() -> T? {
    let lastItem = stackItems.last
    stackItems.removeLast()
    return lastItem
  }
  func isItemInStack(item:T) -> Bool {
    var found = false
    for stackItem in stackItems {
      if stackItem == item {
        found = true
      }
    }
    return found
  }
}
