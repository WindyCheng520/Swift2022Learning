//
//  ListModel.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/13.
//

import Foundation
import UIKit

struct ListModel{
    var icon: UIImage?
    var title: String
    var url: URL
    static func listItemsFromJSONData(jsonData: NSData?) -> [ListModel] {
        guard let nonNilJsonData = jsonData,
              let json = try? JSONSerialization.jsonObject(with: nonNilJsonData as Data, options: []),
            let jsonItems = json as? Array<NSDictionary> else { return [] }
        return jsonItems.compactMap { (itemDesc: NSDictionary) -> ListModel? in
            guard let title = itemDesc["title"] as? String,
                let urlString = itemDesc["url"] as? String,
                let url = URL(string: urlString)
                else { return nil }
            let iconName = itemDesc["icon"] as? String
          //  let icon = UIImage(named: iconName ?? "")
            let icon = iconName.flatMap { UIImage(named: $0) }
            return ListModel(icon: icon, title: title, url: url)
        }
    }
}

//let iconName = itemDesc["icon"] as? String
//item.icon = iconName.flatMap { imageName in UIImage(named: imageName) }

