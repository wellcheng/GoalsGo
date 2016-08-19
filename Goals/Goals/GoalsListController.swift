//
//  ViewController.swift
//  Goals
//
//  Created by WellCheng on 16/8/2.
//  Copyright © 2016年 WellCheng. All rights reserved.
//

import UIKit

class GoalsListController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var goalStore: GoalStore = {
        let goalStore = GoalStore.loadSaved()
        return goalStore
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func basicConfig() {
        self.automaticallyAdjustsScrollViewInsets = false
    }

    func configTableView() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    @IBAction func unwindSugueForCancelAction(unwindSegue: UIStoryboardSegue) {
        
    }

}

extension GoalsListController: UITableViewDelegate {
    
}

extension GoalsListController: UITableViewDataSource {
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.goalStore.goals.count;
    }

    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GoalCell", forIndexPath: indexPath) as! GoalCell
        cell.configCellWithGoal(self.goalStore.goals[indexPath.row])
        return cell
    }
    
}