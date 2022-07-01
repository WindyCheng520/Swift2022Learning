//: Playground - noun: a place where people can play

import UIKit


class VendingMachine{
    
    struct Item{
    
        //这里的Type和Item.Type重名了。解决方案有两个：1）换一个名字；2）在用`把Type包裹起来
        enum ItemType: String{       //swift 3
            case Cola
            case Juice
        }
        
        let type:  ItemType
        let price: Int
        var count: Int
    }
    
    //ErrorType在swift 3中被改名成了Error
    enum ItemError: Error, CustomStringConvertible{         //swift 3
        case NoSuchItem
        case NotEnoughMoney(Int)
        case OutOfStock
        
        var description: String{
            switch self {
            case .NoSuchItem:                return "Not Such Item"
            case .NotEnoughMoney(let price): return "Not Enough Money. " + String(price) + " Yuan needed."
            case .OutOfStock:                return "Out of Stock"
            }
        }
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
        
        dispenseItem(itemName: itemName)      //swift 3
        
        return money - item.price
    }
    
    private func dispenseItem(itemName: String){
        items[itemName]!.count -= 1
        print("Enjoy your",itemName)
    }

    func display(){
        print("Want something to drink?")
        for itemName in items.keys{
            print( "*" , itemName )
        }
        print("=============================")
    }
}

let machine = VendingMachine()
machine.display()

var pocketMoney = 3


// Handle Error by try!
pocketMoney = try! machine.vend(itemName: "Coca Cola", money: pocketMoney)
print(pocketMoney,"Yuan left")


// Handle Error by try?
try? machine.vend(itemName: "Coca Cola", money: pocketMoney)


// Handle Error by do catch
do{
    pocketMoney = try machine.vend(itemName: "Coca Cola", money: pocketMoney)
    print(pocketMoney,"Yuan left")
}
catch VendingMachine.ItemError.NoSuchItem{
    print("No Such Item")
}
catch VendingMachine.ItemError.NotEnoughMoney(let price){
    print("Not Enough Money." , price , "Yuan needed.")
}
catch VendingMachine.ItemError.OutOfStock{
    print("Out of Stock")
}
catch{
    print("Error occured during vending.")
}


do{
    pocketMoney = try machine.vend(itemName: "Coca Cola", money: pocketMoney)
    print(pocketMoney,"Yuan left")
}
catch let error as VendingMachine.ItemError{
    print(error)
}
catch{
    print("Error occured during vending.")
}
