//
//  activityTableViewCell.swift
//  Ignite
//
//  Created by Kevin on 6/15/19.
//  Copyright © 2019 Kevin. All rights reserved.
//

import Foundation
import UIKit

class activityTableViewCell:UITableViewCell{
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var activityTitle: UILabel!
    
    var activity:activitiesStruct!{
        didSet
        {
            updateTableView()
        }
    }
    
    func updateTableView(){
        
        mainImage.image = UIImage(named:"FFFAE3")
        mainImage.layer.cornerRadius = 8.0
        mainImage.layer.masksToBounds = true
        mainImage.clipsToBounds = true
        mainImage.layer.borderColor = UIColor.black.cgColor
        activityTitle.text = activity.activityDescription
    }

}
