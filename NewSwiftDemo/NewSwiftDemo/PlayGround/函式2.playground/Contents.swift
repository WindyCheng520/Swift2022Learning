import UIKit

func caculationArea(withWith width:Float, andHeight height:Float) ->Float{
    return width * height //内部参数名
}

caculationArea(withWith: 25.5, andHeight: 30.5) //外部参数名


//省略第一个外部参数名
func caculationArea1(_ width:Float, andHeight height:Float) ->Float{
    return width * height //内部参数名
}

caculationArea1( 30.5, andHeight: 30.5) //外部参数名


//$0代表数组的元素
let array = [1, 2, 3, 4, 5 , 6, 7]
let result = array.map{
  String($0)
}

print("result:",result);



//filter
//filter：过滤，可以对数组中的元素按照某种规则进行过滤
//输出数组大于5的元素

let filtrArray = [1, 2, 3, 4, 5 , 6, 7]
        let result2 = filtrArray.filter{
          $0 > 5
  }
print("result2:",result2);



//reduce
//计算

//计算数组array元素的和
//在这里$0和$1的意义不同，$0代表元素计算后的结果，$1代表元素
//10代表初始化值，在这里可以理解为 $0初始值 = 10
let result3 = array.reduce(10){
  $0 + $1
}



//合并
let result4 = array.reduce(""){$0 + "\($1)"}// 转换为字符串并拼接
print("result4:",result4);
