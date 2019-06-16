//
//  apollo.swift
//  Ignite
//
//  Created by Kevin on 6/15/19.
//  Copyright © 2019 Kevin. All rights reserved.
//

import Foundation
import Apollo

class Apollo {
    
    // 1
    static let shared = Apollo()
    // 2
    let client: ApolloClient
    
    init() {
        // 3
        client = ApolloClient(url: URL(string: "http://localhost:8080")!)
    }
    
}
