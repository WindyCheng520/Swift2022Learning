//: Playground - noun: a place where people can play

import UIKit


// 之前使用可选型表示错误 - 错误时返回空
Int("2")
Int("Hello, Swift")

// 但空不一定是错误
//在Swift3中，API的命名原则被大幅度调整。大多数函数的名字发生了改变。不过使用方法基本相同。
"Hello, Swift".range(of: "Hi")           //swift 3

// 更符合语意的表示：使用Swift的Error Handling机制
// 比如文件读取; 网络连接 等等等等


class VendingMachine{

    struct Item{
        
        //这里的Type和Item.Type重名了。解决方案有两个：1）换一个名字；2）在用`把Type包裹起来
        enum ItemType: String{       //swift 3
            case Water
            case Cola
            case Juice
        }
        
        let type:  ItemType
        let price: Int
        var count: Int
    }
    
    //ErrorType在swift 3中被改名成了Error
    enum ItemError: Error{              //swift 3
        case NoSuchItem
        case NotEnoughMoney(Int)
        case OutOfStock
    }
    
    private var items = [ "Mineral Water" : Item(type: .Water, price:2, count:10),
                          "Coca Cola" : Item(type: .Cola, price: 3, count: 5),
                          "Orange Juice" : Item(type: .Juice, price: 5, count: 3)]
    
    
    func vend(itemName: String, money: Int) throws -> Int{
        
        guard let item = items[itemName] else{
            throw VendingMachine.ItemError.NoSuchItem
        }
        
        guard money >= item.price else{
            throw VendingMachine.ItemError.NotEnoughMoney(item.price)
        }
        
        guard item.count > 0 else{
            throw VendingMachine.ItemError.OutOfStock
        }
        
        dispenseItem(itemName: itemName)        //swift 3
        
        return money - item.price
    }
    
    private func dispenseItem(itemName: String){
        items[itemName]!.count -= 1
        print("Enjoy your",itemName)
    }
}


