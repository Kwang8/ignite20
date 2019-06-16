//
//  moodResults.swift
//  Ignite
//
//  Created by Kevin on 6/15/19.
//  Copyright © 2019 Kevin. All rights reserved.
//

import Foundation
import UIKit
class moodResults:UIViewController{
    @IBOutlet weak var textView: UILabel!
    var mood = ""
    
    override func viewDidLoad() {
        mood = UserDefaults.standard.string(forKey: "mood") ?? "hi"
        textView.text = ("You look pretty "+mood+"!"+" check out some of the recommended activities for your situation!")
    }
}
