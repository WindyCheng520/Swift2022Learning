//: Playground - noun: a place where people can play

import UIKit

struct Matrix{
    
    var m: [[Int]]
    var row: Int
    var col: Int
    
    init?( _ arr2d:[[Int]] ){
        
        guard arr2d.count > 0 else{
            return nil
        }
        
        let row = arr2d.count
        let col = arr2d[0].count
        for i in 1..<row{
            if arr2d[i].count != row{
                return nil
            }
        }
        
        self.m = arr2d
        self.row = row
        self.col = col
    }
    
    static func identityMatrix(n: Int) -> Matrix?{
        
        if n <= 0{
            return nil
        }
        
        var arr2d:[[Int]] = []
        for i in 0..<n{
            //在Swift3中，API的命名原则被大幅度调整。大多数函数的名字发生了改变。不过使用方法基本相同。
            var row = [Int](repeatElement(0, count: n))      //swift 3
            row[i] = 1
            arr2d.append( row )
        }
        
        return Matrix(arr2d)
    }
    
    func printMatrix(){
        for i in 0..<row{
            for j in 0..<col{
                print(m[i][j],terminator:"\t")
            }
            print()
        }
    }
}


let m = Matrix([[1,2],[3,4]])!
m.printMatrix()

let e = Matrix.identityMatrix(n: 6)    //swift 3
e!.printMatrix()

