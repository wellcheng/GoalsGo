//
//  GoalCell.swift
//  Goals
//
//  Created by WellCheng on 16/8/19.
//  Copyright © 2016年 WellCheng. All rights reserved.
//

import Foundation
import UIKit

class GoalCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var goalIcon: UIImageView!
    @IBOutlet weak var detailProgress: UILabel!
    @IBOutlet weak var percentProgress: UILabel!
    
    func configCellWithGoal(goal: GoalsModel) {
        self.title.text = goal.title
        self.goalIcon.backgroundColor = UIColor.darkGrayColor()
        self.detailProgress.text = "\(goal.completedItems) / \(goal.totalItems) \(goal.measure)"
        self.percentProgress.text = "\(goal.completionDegree)"
    }
}