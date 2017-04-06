//
//  SignUpViewController.swift
//  FirebaseTutorial
//
//  Created by James Dacombe on 16/11/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    //Outlets
    @IBOutlet weak var usrNameLbl: UITextField!
    @IBOutlet weak var emailLbl: UITextField!
    @IBOutlet weak var passLbl: UITextField!
    @IBOutlet weak var saveUsrButton: UIButton!
    
    @IBAction func goBack(_ sender: Any) {
        self .dismiss(animated: false, completion: nil)
    }
    //Sign Up Action for email
    @IBAction func createAccountAction(_ sender: AnyObject) {
        saveUsrButton.isEnabled = false
        FIRAuth.auth()!.createUser(
            withEmail: emailLbl.text!,
            password: passLbl.text!) {
                user, error in
                if error == nil {
                    FIRAuth.auth()!.signIn(
                            withEmail: self.emailLbl.text!,
                            password: self.passLbl.text!
                    )
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let controller = storyboard.instantiateViewController(withIdentifier: "MainViewController")
                    self.present(controller, animated: true, completion: nil)
                }
                else{
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
                        case .errorCodeEmailAlreadyInUse:
                            print("Email already in use")
                            alertController = UIAlertController(title: "Error", message: "This email is already in use", preferredStyle: UIAlertControllerStyle.alert)
                            alertController.addAction(okButton)
                            self.present(alertController, animated: true, completion: nil)
                        case .errorCodeWeakPassword:
                            print("Password weak")
                            alertController = UIAlertController(title: "Error", message: "Password is too weak. Please choose a password which contains at least 6 characters.", preferredStyle: UIAlertControllerStyle.alert)
                            alertController.addAction(okButton)
                            self.present(alertController, animated: true, completion: nil)
                        default:
                            // ALWAYS GET HERE.
                            print(error)
                            alertController = UIAlertController(title: "Error", message: "An unknown error occured.", preferredStyle: UIAlertControllerStyle.alert)
                            alertController.addAction(okButton)
                            self.present(alertController, animated: true, completion: nil)
                        }
                    }
                    
                }
            }
    }
    
    
}

