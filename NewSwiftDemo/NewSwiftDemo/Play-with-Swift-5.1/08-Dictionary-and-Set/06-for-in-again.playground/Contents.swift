//: Playground - noun: a place where people can play

import UIKit

// 对Range使用for-in
for number in 1..<10{
    number
}


// 对String.characters使用for-in

/*更新:
 swift2:
for c in "Hello".characters{
    c
}
 swift 3中直接使用 for c in "Hello"就可以了
 */
for c in "Hello"{
    c
}


// 对Array使用for-in
var vowels = ["a","e","i","o","u"]
for vowel in vowels{
    vowel
}

// for (i,vowel) in vowels.enumerate(){  //swift 2
for (i,vowel) in vowels.enumerated(){     //swift 3
    i
    vowel
}


// 对Dictionary使用for-in
var dict = [1:"A", 2:"B", 3:"C"]
for key in dict.keys{
    key
}

for value in dict.values{
    value
}

for (key,value) in dict{
    key
    value
}


// 对Set使用for-in
var set = Set(vowels)
for vowel in set{
    vowel
}


// 奇奇怪怪的类型？
//"Hello".characters        //swift 2
"Hello"                     //swift 3
//vowels.enumerate()        //swift 2
vowels.enumerated()         //swift 3
dict.keys

// 可迭代

//vowels.removeAll(keepCapacity: <#T##Bool#>)
//vowels.replaceRange(<#T##subRange: Range<Int>##Range<Int>#>, with: <#T##CollectionType#>)
//
//dict.prefixUpTo(<#T##end: DictionaryIndex<Int, String>##DictionaryIndex<Int, String>#>)
//
//set.insert(<#T##member: Hashable##Hashable#>)
//set.union(<#T##sequence: SequenceType##SequenceType#>)
//set.prefixThrough(<#T##position: SetIndex<String>##SetIndex<String>#>)

