import UIKit
import Foundation

public class Store {
    let storesToDisk: Bool = true
}
public class BookmarkStore: Store {
    let itemCount: Int = 10
}
public struct Bookmark {
   enum Group {
      case Tech
      case News
   }
   /*private*/ let store = {
       return BookmarkStore()
   }()
   let title: String?
   let url: URL
   let keywords: [String]
   let group: Group
}

let aBookmark = Bookmark(title: "Appventure", url: URL(string: "appventure.me")!, keywords: ["Swift", "iOS", "OSX"], group: .Tech)

let aMirror = Mirror(reflecting: aBookmark)
print(aMirror)
print (aMirror.displayStyle ?? "")

for case let (label?, value) in aMirror.children {
    print (label, value)
}


print(aMirror.subjectType)
//输出 : Bookmark
print(Mirror(reflecting: 5).subjectType)
//输出 : Int
print(Mirror(reflecting: "test").subjectType)
//输出 : String
print(Mirror(reflecting: NSNull()).subjectType)
//输出 : NSNull


// 试试 struct
print(Mirror(reflecting: aBookmark).superclassMirror)
// 输出: nil
// 试试 class
print(Mirror(reflecting: aBookmark.store).superclassMirror)
// 输出: Optional(Mirror for Store)

