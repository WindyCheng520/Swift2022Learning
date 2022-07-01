//
//  HJModel.swift
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/27.
//

import Foundation
import HandyJSON

struct HJModel: HandyJSON {
 
    var data = [DataModel]()
    var page: String?
    var pageSize: String?
    var stat: String?
     
    struct DataModel {
        var author_name: String?
        var category: String?
        var date: String?
        var is_content: String?
        var thumbnail_pic_s: String?
        var thumbnail_pic_s02: String?
        var thumbnail_pic_s03: String?
        var title: String?
        var uniquekey: String?
        var url: String?
    }
}
