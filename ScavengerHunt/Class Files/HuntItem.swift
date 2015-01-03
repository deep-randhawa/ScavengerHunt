//
//  HuntItem.swift
//  ScavengerHunt
//
//  Created by Deep Randhawa on 1/4/15.
//  Copyright (c) 2015 Deep Randhawa. All rights reserved.
//

import Foundation
import UIKit

class HuntItem: NSObject {
    let name: String
    var photo: UIImage?
    var completed: Bool {
        get {
            return photo != nil
        }
    }
    
    init(name: String) {
        self.name = name
    }
}