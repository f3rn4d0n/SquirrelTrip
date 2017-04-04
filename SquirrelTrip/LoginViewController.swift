//
//  LoginViewController.swift
//  FirebaseTutorial
//
//  Created by James Dacombe on 16/11/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {


//Outlets
    @IBOutlet weak var placeImg: UIImageView!
    @IBOutlet weak var usrNameLbl: UITextField!
    @IBOutlet weak var usrPassLbl: UITextField!


    //Login Action
    @IBAction func signIn(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: usrNameLbl.text!, password: usrPassLbl.text!) { (user, error) in
            // ...
        }
        
        
    }
    @IBAction func forgotPassword(_ sender: Any) {
    }
    @IBAction func signUp(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        // 1
        let rootRef = FIRDatabase.database().reference()
        
        // 2
        let childRef = FIRDatabase.database().reference(withPath: "grocery-items")
        
        // 3
        let itemsRef = rootRef.child("grocery-items")
        
        // 4
        let milkRef = itemsRef.child("milk")
        
        // 5
        print(rootRef.key)   // prints: ""
        print(childRef.key)  // prints: "grocery-items"
        print(itemsRef.key)  // prints: "grocery-items"
        print(milkRef.key)   // prints: "milk"
        
        
        
                

    }
    
    

}
