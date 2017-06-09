//
//  PlacesListFirebase.swift
//  SquirrelTrip
//
//  Created by Luis F. Bustos Ramirez on 07/06/17.
//  Copyright © 2017 Luis Fernando Bustos Ramírez. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class PlacesListFirebase: NSObject {
    
    var ref = FIRDatabase.database().reference()
    var recentPlaces = FIRDatabaseQuery()
    
    override init(){
        self.ref = FIRDatabase.database().reference()
    }

    func getListOfPlaces(){
        // Last 100 posts, these are automatically the 100 most recent
        // due to sorting by push() keys
        
        self.ref = FIRDatabase.database().reference()
        recentPlaces = self.ref.child("Place")
        print("listo")
    }
    
    
    func writeNewPlace(){
        let key = self.ref.child("Place").childByAutoId().key
        let place = ["name": "Tlalpan",
                    "score": "4.2",
                    "latitude": "1.67328",
                    "longitude": "-98.123123",
                    "description": "Realizando pruebas",
        ]
        let childUpdates = ["/Place/\(key)": place
                            //"/user-places/\(userID)/\(key)/": place
        ]
        self.ref.updateChildValues(childUpdates)
        
        
    }
    
    
    func editSomePlace(by username:String){
        
        FIRAuth.auth()?.addStateDidChangeListener { auth, user in
            if let user = user {
                self.ref.child("users").child(user.uid).setValue(["username": username])
                self.ref.child("users/(user.uid)/username").setValue(username)
            } else {
                // No user is signed in.
            }
        }
        
    }
    
    
}
