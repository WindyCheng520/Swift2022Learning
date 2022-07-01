import UIKit


//https://www.jianshu.com/p/1e7fdf7f8f13


//一、 冒泡排序
//比较相邻两个数据如果。第一个比第二个大，就交换两个数
//对每一个相邻的数做同样1的工作，这样从开始一队到结尾一队在最后的数就是最大的数。
//针对所有元素上面的操作，除了最后一个。
//重复1~3步骤，直到顺序完成。

///冒泡
func bubbleSort(_ nums: inout [Int]) {
    let n = nums.count
    for i in 0..<n {
        for j in 0..<(n - 1 - i) {
            if nums[j] > nums[j + 1] {
                nums.swapAt(j, j + 1)
            }
        }
    }
    print("冒泡: \(nums)")
}


var array0 = [7, 1, 5, 2, 4, 8, 10]
let _: () = bubbleSort(&array0)



//二、 选择排序
//1.在一个长度为 N 的无序数组中，第一次遍历 n-1 个数找到最小的和第一个数交换。
//2.第二次从下一个数开始遍历 n-2 个数，找到最小的数和第二个数交换。
//3.重复以上操作直到第 n-1 次遍历最小的数和第 n-1 个数交换，排序完成。

///选择排序
func selectionSort(_ nums: inout [Int]) {
    let n = nums.count
    for i in 0..<n {
        var k = i //从第一个元素开始取
        for j in (k+1..<n){ //选择K后面的元素
            if(nums[k] > nums[j]){
                k = j //取小的元素
            }
        }
        if(k != i){
            nums.swapAt(k, i)//交换位置
        }
    }
    print("选择: \(nums)")
}

let _: () = selectionSort(&array0)


//快速排序
//时间复杂度O( Nlog2N)）
func quickSorted(_ nums: inout [Int]) {
    guard nums.count > 1 else { return }
    let pivot:Int! = nums.first
    let p = nums.partition(by: { $0 > pivot! })
    var first = Array(nums[1..<p])
    var second = Array(nums[p...])
    quickSorted(&first)
    quickSorted(&second)
    nums = Array(first) + Array([pivot]) + Array(second)
    print("快速: \(nums)")
}
let _: () = quickSorted(&array0)


//插入排序
func insertionSort(_ nums: inout [Int]) {
    let n = nums.count;
    for i in 1..<n {
        for j in 1...i {
            if nums[j] < nums[j-1] {
                nums.swapAt(j, j-1)
            }
        }
    }
    print("插入: \(nums)")
}

let _: () = insertionSort(&array0)


//希尔排序
func shellSort(_ nums: inout [Int]) {
    var gap:Int = nums.count/2 //步长（当步长=1时，就是插入排序）
    while gap > 0 {
        for i in 0 ..< nums.count {
            var j = i
            while (j+gap) < nums.count {
                if nums[j] > nums[j+gap] {
                    nums.swapAt(j, j+gap)
                }
                j = j+gap
            }
        }
        gap = gap / 2
    }
    print("希尔: \(nums)")
}

let _: () = shellSort(&array0)

