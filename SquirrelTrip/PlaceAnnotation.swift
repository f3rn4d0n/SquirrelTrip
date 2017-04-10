//
//  PlaceAnnotation.swift
//  SquirrelTrip
//
//  Created by Luis Fernando Bustos Ramírez on 4/9/17.
//  Copyright © 2017 Luis Fernando Bustos Ramírez. All rights reserved.
//

import Foundation
import MapKit

class PlaceAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    
    init(location: CLLocationCoordinate2D, title: String) {
        self.coordinate = location
        self.title = title
        
        super.init()
    }
}
