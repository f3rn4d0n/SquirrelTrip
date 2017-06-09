//
//  SharedFunctionsObjects.swift
//  SquirrelTrip
//
//  Created by Luis F. Bustos Ramirez on 06/04/17.
//  Copyright © 2017 Luis Fernando Bustos Ramírez. All rights reserved.
//

import UIKit

class SharedFunctionsObjects: NSObject {

    // Can't init is singleton
    private override init() { }
    
    //MARK: Shared Instance
    
    static let sharedInstance: SharedFunctionsObjects = SharedFunctionsObjects()
    
    //MARK: Local Variable
    
    var emptyStringArray : [String] = []

}
