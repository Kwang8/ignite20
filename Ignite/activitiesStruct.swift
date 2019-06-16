//
//  activitiesStruct.swift
//  Ignite
//
//  Created by Kevin on 6/15/19.
//  Copyright © 2019 Kevin. All rights reserved.
//

import Foundation
import Apollo
struct activitiesStruct{
    
    let activityDescription:String
    let activityType:String
    private let apollo = ApolloClient(url: URL(string: "https://six-ignite-nine.herokuapp.com/")!)
    static func fetchActivites() -> [activitiesStruct]{
      
        apollo.fetch(query: activitiesQuery()) { (result, error) in
            print() // Luke Skywalker
        }
        let one = activitiesStruct(activityDescription: "nice activity", activityType: "sina and anekeit")
        
        let two = activitiesStruct(activityDescription: "bad activity", activityType: "Orko")
        
        let three = activitiesStruct(activityDescription: "fun activity", activityType: "kevin")
        
        return [one,two,three]
        
    }
    
    
   
    
}
