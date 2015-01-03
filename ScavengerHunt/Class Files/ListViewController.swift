//
//  ListViewController.swift
//  ScavengerHunt
//
//  Created by Deep Randhawa on 1/3/15.
//  Copyright (c) 2015 Deep Randhawa. All rights reserved.
//

import Foundation
import UIKit

class ListViewController : UITableViewController {
    var itemsList = [HuntItem(name: "Lion"),
        HuntItem(name: "Tiger"),
        HuntItem(name: "Apple"),
        HuntItem(name: "Forest")]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = itemsList[indexPath.row].name
        return cell
    }
}
