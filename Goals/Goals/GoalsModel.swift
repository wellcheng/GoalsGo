//
//  GoalsModel.swift
//  Goals
//
//  Created by WellCheng on 16/8/18.
//  Copyright © 2016年 WellCheng. All rights reserved.
//

import Foundation


class GoalsModel: NSCoding {

    // 目标名
    var title = "新目标"
    
    // item 的计量制度，如 页、节、等
    var measure = ""
    
    // 总 item
    var totalItems: Double = 0.0
    
    // 已完成 item
    var completedItems = 0.0
    
    // 当前完成度
    var completionDegree: Double {
        get {
            return completedItems / totalItems
        }
    }
    
    @objc internal func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(title, forKey: "title")
        aCoder.encodeObject(measure, forKey: "measure")
        aCoder.encodeDouble(totalItems, forKey: "totalItems")
        aCoder.encodeDouble(completedItems, forKey: "completedItems")
    }
    
    @objc internal required convenience init?(coder aDecoder: NSCoder) { // NS_DESIGNATED_INITIALIZER
        self.init()
        self.title = aDecoder.decodeObjectForKey("title") as! String
        self.measure = aDecoder.decodeObjectForKey("measure") as! String
        self.totalItems = aDecoder.decodeDoubleForKey("totalItems")
        self.completedItems = aDecoder.decodeDoubleForKey("completedItems")
    }
    
}

