//
//  ListItem.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/13.
//

import Foundation
import UIKit


class ListItem {
    var icon: UIImage?
    var title: String = ""
    var url: URL!

//    static func listItemsFromJSONData(jsonData: NSData?) -> [ListItem] {
//        guard let nonNilJsonData = jsonData,
//            let json = try? JSONSerialization.jsonObject(with: nonNilJsonData as Data, options: []),
//            let jsonItems = json as? Array<NSDictionary>
//            else {
//                // If we failed to unserialize the JSON
//                // or that JSON wasn't an Array of NSDictionaries,
//                // then bail early with an empty array
//                return []
//        }
//
//        var items = [ListItem]()
//        for itemDesc in jsonItems {
//            let item = ListItem()
//            if let icon = itemDesc["icon"] as? String {
//                item.icon = UIImage(named: icon)
//            }
//            if let title = itemDesc["title"] as? String {
//                item.title = title
//            }
//            if let urlString = itemDesc["url"] as? String, let url = URL(string: urlString) {
//                item.url = url
//            }
//            items.append(item)
//        }
//        return items
//    }
    
    
    static func listItemsFromJSONData(jsonData: NSData?) -> [ListItem] {
        guard let nonNilJsonData = jsonData,
            let json = try? JSONSerialization.jsonObject(with: nonNilJsonData as Data, options: []),
            let jsonItems = json as? Array<NSDictionary>
            else {
                // If we failed to unserialize the JSON
                // or that JSON wasn't an Array of NSDictionaries,
                // then bail early with an empty array
                return []
             }
        return jsonItems.compactMap { (itemDesc: NSDictionary) -> ListItem? in
            guard let title = itemDesc["title"] as? String,
                let urlString = itemDesc["url"] as? String,
                let url = URL(string: urlString)
                else { return nil }
            let li = ListItem()
            if let icon = itemDesc["icon"] as? String {
                li.icon = UIImage(named: icon)
            }
            li.title = title
            li.url = url as URL
            return li
        }

    }
    
}
