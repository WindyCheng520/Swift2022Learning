import UIKit



struct ViewModel {
  let title: String
  let image: UIImage
}

//假如有5个模型

//第一种常规方式我们可以这样

let viewModel1 = ViewModel(title: "1", image: UIImage())
let viewModel2 = ViewModel(title: "2", image: UIImage())
let viewModel3 = ViewModel(title: "3", image: UIImage())
let viewModel4 = ViewModel(title: "4", image: UIImage())
let viewModel5 = ViewModel(title: "5", image: UIImage())
let viewModels = [viewModel1, viewModel2, viewModel3, viewModel4, viewModel5]




//第二种方式:

let titles: [String] = ["1", "2", "3", "4", "5"]
let images: [UIImage] = [UIImage(), UIImage(),UIImage(),UIImage(),UIImage()]

var viewModels1: [ViewModel] = []
for i in 0 ..< titles.count {
  viewModels1.append(ViewModel(title: titles[i], image: images[i]))
}


//使用zip 函数
let viewModels2 = zip(titles, images).map(ViewModel.init)



//那么如果ViewModel不是有两个元素而是三个呢. 可以选择zip嵌套或者ViewModel属性里用元组的方式.
//zip(array1, zip(array2, array3)).map {
//      ViewModel.init(a: $0, b: $1.0, c: $1.1)
//}




