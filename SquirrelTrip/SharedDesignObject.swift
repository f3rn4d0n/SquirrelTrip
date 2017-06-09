//
//  SharedDesignObject.swift
//  SquirrelTrip
//
//  Created by Luis F. Bustos Ramirez on 06/04/17.
//  Copyright © 2017 Luis Fernando Bustos Ramírez. All rights reserved.
//

import UIKit

class SharedDesignObject: NSObject {
    
    // Can't init is singleton
    private override init() { }
    
    //MARK: Shared Instance
    
    static let sharedInstance: SharedDesignObject = SharedDesignObject()
    
    //MARK: Add on view
    
    static func fill(Container container: UIView, inView view: UIView, andBottom bottom:NSInteger, andTop top:NSInteger, andLeading leading:NSInteger, andTrailing trailing:NSInteger){
        let constraintTop = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: CGFloat(top))
        
        let constraintLeading = NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: CGFloat(leading))
        
        let constraintBottom = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: CGFloat(bottom))
        
        let constraintTrailing = NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: CGFloat(trailing))
     
        view.translatesAutoresizingMaskIntoConstraints = false
        
        
        container.addSubview(view)
        container.addConstraint(constraintTop)
        container.addConstraint(constraintBottom)
        container.addConstraint(constraintLeading)
        container.addConstraint(constraintTrailing)
        
    }
    

}
