//
//  language.swift
//  readIt
//
//  Created by Bustos Ramírez Luis Fernando on 01/09/16.
//  Copyright © 2016 Bustos Ramírez Luis Fernando. All rights reserved.
//

import Foundation

class language {
    // MARK: Properties
    
    var name: String
    var iso639: String
    
    // MARK: Initialization
    
    init?(name: String, iso639: String) {
        // Initialize stored properties.
        self.name = name
        self.iso639 = iso639
        
        // Initialization should fail if there is no iso639
        if iso639.isEmpty {
            return nil
        }
    }
    
}