//
//  Loan .swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/14.
//

import Foundation


//多个初始化器重构后
struct Loan {
    let commitment: NSDecimalNumber
    let riskRating: Float
    let maturity: Int
    let expiry: Date?
    let capitalStrategy: String?
    let outstanding: NSDecimalNumber?
    
     // 原来的初始化构造器（initializer）现在可以是私有的
    private init(commitment: NSDecimalNumber, riskRating: Float, maturity: Int, expiry: Date?, capitalStrategy: String?, outstanding: NSDecimalNumber?) {
        self.commitment = commitment
        self.riskRating = riskRating
        self.maturity = maturity
        self.expiry = expiry
        self.capitalStrategy = capitalStrategy
        self.outstanding = outstanding
    }
    
    static func createTermLoan(commitment: NSDecimalNumber, riskRating: Float, maturity: Int) -> Loan {
        return Loan(commitment: commitment, riskRating: riskRating, maturity: maturity, expiry: nil, capitalStrategy: nil, outstanding: nil)
    }
    
    static func createTermLoan(capitalStrategy: String, commitment: NSDecimalNumber, outstanding: NSDecimalNumber, riskRating: Float, maturity: Int, expiry: Date) -> Loan {
        return Loan(commitment: commitment, riskRating: riskRating, maturity: maturity, expiry: expiry, capitalStrategy: capitalStrategy, outstanding: outstanding)
    }
    
    static func createRevolverLoan(commitment: NSDecimalNumber, outstanding: NSDecimalNumber, riskRating: Float, maturity: Int, expiry: Date) -> Loan {
        return Loan(commitment: commitment, riskRating: riskRating, maturity: maturity, expiry: expiry, capitalStrategy: nil, outstanding: outstanding)
    }
    
    static func createRevolverLoan(capitalStrategy: String, commitment: NSDecimalNumber, riskRating: Float, maturity: Int, expiry: Date) -> Loan {
        return Loan(commitment: commitment, riskRating: riskRating, maturity: maturity, expiry: expiry, capitalStrategy: capitalStrategy, outstanding: nil)
    }
    
    static func createRCTL(commitment: NSDecimalNumber, riskRating: Float, maturity: Int, expiry: Date) -> Loan {
        return Loan(commitment: commitment, riskRating: riskRating, maturity: maturity, expiry: expiry, capitalStrategy: nil, outstanding: nil)
    }
}



//能在 setter 方法中调用父类么？比如在赋新值时复写 setter，而是调用其父类的方法？
//完全可以
class Foo {
    var value: String
    init(value: String) { self.value = value }
}
class SubFoo: Foo {
    override var value: String {
        get { return super.value }
        set { super.value = newValue.lowercased()
        }
    }
}
