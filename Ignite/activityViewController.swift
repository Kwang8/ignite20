//
//  activityViewController.swift
//  Ignite
//
//  Created by Kevin on 6/15/19.
//  Copyright © 2019 Kevin. All rights reserved.
//

import Foundation
import UIKit

class activityViewController:UITableViewController
{
    var cells:[activitiesStruct] = activitiesStruct.fetchActivites()
    
    override func viewDidLoad() {
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "viewCell", for: indexPath) as! activityTableViewCell
        let activitey = cells[indexPath.row]
        
        cell.activity = activitey
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hi")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
