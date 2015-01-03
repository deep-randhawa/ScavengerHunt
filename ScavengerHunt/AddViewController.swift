//
//  ViewController.swift
//  ScavengerHunt
//
//  Created by Deep Randhawa on 1/3/15.
//  Copyright (c) 2015 Deep Randhawa. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var newItem: HuntItem?
    @IBOutlet weak var textField: UITextField!
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DoneItem" {
            if (!textField.text.isEmpty) {
                newItem = HuntItem(name: textField.text)
            }
        }
    }
}

