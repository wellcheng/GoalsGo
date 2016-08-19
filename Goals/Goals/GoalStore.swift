//
//  GoalStore.swift
//  Goals
//
//  Created by WellCheng on 16/8/19.
//  Copyright © 2016年 WellCheng. All rights reserved.
//

import Foundation

class GoalStore: NSObject, NSCoding {
    
    // 所有的 goals
    var goals = Array<GoalsModel>()
    
    var count: Int {
        get {
            return goals.count
        }
    }
    
    func addGoal(goal: GoalsModel) {
        goals.append(goal)
    }
    
    // MARK: Init
    required override init() {
        super.init()
    }

    // MARK: Coding
    
    internal func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(goals, forKey: "goals")
    }
    
    internal required convenience init(coder aDecoder: NSCoder) { // NS_DESIGNATED_INITIALIZER
        self.init()
        self.goals = aDecoder.decodeObjectForKey("goals") as! Array<GoalsModel>
    }

    
    func save() {
        let data = NSKeyedArchiver.archivedDataWithRootObject(self)
        NSUserDefaults.standardUserDefaults().setObject(data, forKey: "GoalStore")
    }
    
    func clear() {
        NSUserDefaults.standardUserDefaults().removeObjectForKey("GoalStore")
    }
    
    class func loadSaved() -> GoalStore {
        if let data = NSUserDefaults.standardUserDefaults().objectForKey("GoalStore") as? NSData {
            return NSKeyedUnarchiver.unarchiveObjectWithData(data) as! GoalStore
        }
        return GoalStore()
    }
}



