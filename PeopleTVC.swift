//
//  PeopleTVC.swift
//  NamePuzzle
//
//  Created by Neil Reisenauer on 5/24/16.
//  Copyright © 2016 r-neil. All rights reserved.
//

import UIKit

class PeopleTVC: UITableViewController, gitHubData {
    
   private var dataModel : PeopleModel?
    private struct Storyboard{
        static let cellName = "PeopleTableCell" //cell name on storyboard
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dataModel = PeopleModel()
        dataModel!.gitHubDataDelegate = self
    }
    
    //MARK: TableView Methods
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel!.rowCount()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let peopleCell = tableView.dequeueReusableCellWithIdentifier(Storyboard.cellName)
        
        peopleCell!.textLabel?.text = dataModel!.getCombinedNameForRow(indexPath.row)
        
        return peopleCell!
    }
    
    //Delegate Method from JSONHelper. Called when data is finished downloading.
    //Call is made on Main Queue to refresh UI
    func peopleDataReady(){
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
           self.tableView.reloadData()
        })
    }
}
