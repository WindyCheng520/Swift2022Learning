import UIKit


//数组元素乘以2
(1...1024).map{$0 * 2}


//数组元素求和
(1...1024).reduce(0,+)



//#3 证明字符串中含有某个单词
let words = ["Swift","iOS","cocoa","OSX","tvOS"]
let tweet = "This is an example tweet larking about Swift"
let valid = !words.filter({tweet.contains($0)}).isEmpty
valid //true

let contain = tweet.split(separator: " ")
  .lazy
  .map(String.init)
  .contains(where: Set(words).contains)

contain



////#4 读取一个文件
//let path = Bundle.main.path(forResource: "test", ofType: "txt")
//let lines = try? String(contentsOfFile: path!).split{$0 == "\n"}.map(String.init)
//if let lines=lines {
//    lines[0] // O! for a Muse of fire, that would ascend
//    lines[1] // The brightest heaven of invention!
//    lines[2] // A kingdom for a stage, princes to act
//    lines[3] // And monarchs to behold the swelling scene.
//}


//#5 祝你生日快乐
let name = "uraimo"
(1...4).forEach{print("Happy Birthday " + (($0 == 3) ? "dear \(name)":"to You"))}




//#6 数组过滤
extension Sequence{
    typealias Element = Self.Iterator.Element
    
    func partitionBy(fu: (Element)->Bool)->([Element],[Element]){
        var first = [Element]()
        var second = [Element]()
        for el in self {
            if fu(el) {
                first.append(el)
            }else{
                second.append(el)
            }
        }
        return (first,second)
    }
    
    
    
    
    func anotherPartitionBy(fu: (Self.Iterator.Element)->Bool)->([Self.Iterator.Element],[Self.Iterator.Element]){
           return (self.filter(fu),self.filter({!fu($0)}))
       }
    
    
}

let part = [82, 58, 76, 49, 88, 90].partitionBy{$0 < 60}
part // ([58, 49], [82, 76, 88, 90])



let part2 = [82, 58, 76, 49, 88, 90].anotherPartitionBy{$0 < 60}
part2 // ([58, 49], [82, 76, 88, 90])


var part3 = [82, 58, 76, 49, 88, 90].reduce( ([],[]), {
    (a:([Int],[Int]),n:Int) -> ([Int],[Int]) in
    (n<60) ? (a.0+[n],a.1) : (a.0,a.1+[n])
})
part3 // ([58, 49], [82, 76, 88, 90])




//let xmlDoc = try? AEXMLDocument(xmlData: NSData(contentsOfURL: NSURL(string:"https://www.ibiblio.org/xml/examples/shakespeare/hen_v.xml")!)!)
//if let xmlDoc=xmlDoc {
//    var prologue = xmlDoc.root.children[6]["PROLOGUE"]["SPEECH"]
//    prologue.children[1].stringValue // Now all the youth of England are on fire,
//    prologue.children[2].stringValue // And silken dalliance in the wardrobe lies:
//    prologue.children[3].stringValue // Now thrive the armourers, and honour's thought
//    prologue.children[4].stringValue // Reigns solely in the breast of every man:
//    prologue.children[5].stringValue // They sell the pasture now to buy the horse,
//}



//Find the minimum of an array of Ints
[10,-22,753,55,137,-1,-279,1034,77].sorted(by: <).first
[10,-22,753,55,137,-1,-279,1034,77].reduce(Int.max, min)
[10,-22,753,55,137,-1,-279,1034,77].min()
//Find the maximum of an array of Ints
[10,-22,753,55,137,-1,-279,1034,77].sorted(by: <).last
[10,-22,753,55,137,-1,-279,1034,77].reduce(Int.min, max)
[10,-22,753,55,137,-1,-279,1034,77].max()


let n = 10
var sameprimes = Set(2...n)

//sameprimes.subtracting((2...Int(sqrt(Double(n)))).compactMap{ (2*$0).stride(from: 0, to: n, by: $0)} )
//sameprimes.subtractInPlace((2...Int(sqrt(Double(n))))
                         //  .flatMap{ (2*$0).stride(through:n, by:$0)})
sameprimes.sorted()

sameprimes



//元组交换两个数
//var a = 1,b = 2
//(a,b) = (b,a)
//a //2
//b //1

