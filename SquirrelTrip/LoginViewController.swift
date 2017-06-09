//
//  LoginViewController.swift
//  FirebaseTutorial
//
//  Created by James Dacombe on 16/11/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {


//Outlets
    @IBOutlet weak var placeImg: UIImageView!
    @IBOutlet weak var usrNameLbl: UITextField!
    @IBOutlet weak var usrPassLbl: UITextField!


    //Login Action
    @IBAction func signIn(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: usrNameLbl.text!, password: usrPassLbl.text!) { (user, error) in
            if error == nil {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "MainViewController")
                self.present(controller, animated: true, completion: nil)
            }else{
                if let errCode = FIRAuthErrorCode(rawValue: error!._code) {
                    
                    var alertController = UIAlertController(title: "", message: "", preferredStyle: UIAlertControllerStyle.alert)
                    let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                        (result: UIAlertAction) -> Void in
                        print("Error transmitted")
                    }
                    
                    switch errCode {
                    case .errorCodeInvalidEmail:
                        print("Invalid email")
                        alertController = UIAlertController(title: "Error", message: "Email syntax is not correct", preferredStyle: UIAlertControllerStyle.alert)
                        alertController.addAction(okButton)
                        self.present(alertController, animated: true, completion: nil)
                    default:
                        // ALWAYS GET HERE.
                        print(error!)
                        alertController = UIAlertController(title: "Error", message: "An unknown error occured.", preferredStyle: UIAlertControllerStyle.alert)
                        alertController.addAction(okButton)
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }
        }
        
    }
    @IBAction func forgotPassword(_ sender: Any) {
    }
    @IBAction func signUp(_ sender: Any) {
    }
    
    
    

}
