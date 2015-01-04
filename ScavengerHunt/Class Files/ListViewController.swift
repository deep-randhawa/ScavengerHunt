//
//  ListViewController.swift
//  ScavengerHunt
//
//  Created by Deep Randhawa on 1/3/15.
//  Copyright (c) 2015 Deep Randhawa. All rights reserved.
//

import Foundation
import UIKit

class ListViewController : UITableViewController,
    UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    var itemsList = [HuntItem(name: "Lion"),
        HuntItem(name: "Tiger"),
        HuntItem(name: "Apple"),
        HuntItem(name: "Forest")]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath) as UITableViewCell
        let item = itemsList[indexPath.row]
        cell.textLabel?.text = item.name
        
        if (item.completed) {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            cell.imageView?.image = item.photo
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
            cell.imageView?.image = nil
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        } else {
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: NSDictionary) {
        if let indexPath = tableView.indexPathForSelectedRow() {
            let selectedItem = itemsList[indexPath.row]
            let photo = info[UIImagePickerControllerOriginalImage] as UIImage
            selectedItem.photo = photo
            
            dismissViewControllerAnimated(true, completion: {
                self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)})
        }
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        if segue.identifier == "DoneItem" {
            let addItemController = segue.sourceViewController as AddViewController
            if addItemController.newItem != nil {
                let newItem = addItemController.newItem
                itemsList.append(newItem!)
                
                let indexPath = NSIndexPath(forItem: itemsList.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
    }
}
