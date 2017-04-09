//
//  ViewController.swift
//  SquirrelTrip
//
//  Created by Luis Fernando Bustos Ramírez on 3/21/17.
//  Copyright © 2017 Luis Fernando Bustos Ramírez. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var trailingTVConstraint: NSLayoutConstraint!
    
    var menuOptions: NSMutableArray = []
    //MARK: Prepare interface
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        menuTableView.delegate = self
        menuTableView.dataSource = self
        trailingTVConstraint.constant = -240
        getListOfMenuOptions()
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "PlacesList")
        self.present(controller, animated: true, completion: nil)
        
        SharedDesignObject.fill(Container: self.contentView, inView: controller.view, andBottom: 0, andTop: 0, andLeading: 0, andTrailing: 0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getListOfMenuOptions(){
        menuOptions = ["List", "Camera Mode", "Map View", "Settings", "Log Out"]
    }
    
    
    //MARK: Buttons behavior
    @IBAction func menuAction(_ sender: Any) {
        
//        UIView.beginAnimations(nil, context: nil)
//        UIView.setAnimationDuration(4.0)
//        if self.trailingTVConstraint.constant == 0{
//            self.trailingTVConstraint.constant = -240
//        }else{
//            self.trailingTVConstraint.constant = 0
//        }
//        
//        UIView.commitAnimations()
//        
        
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            if self.trailingTVConstraint.constant == 0{
                self.trailingTVConstraint.constant = -240
            }else{
                self.trailingTVConstraint.constant = 0
            }
            self.view.layoutIfNeeded()
        }, completion: { (finished: Bool) in
        })
    }
    
    
    //MARK: Delegates of table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell?
        cell = tableView.dequeueReusableCell(withIdentifier: "Prueba")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Prueba")
        }
        let message = menuOptions[indexPath.row]
        cell?.textLabel?.text = message as? String
        cell?.backgroundColor = UIColor.init(red: 57/255, green: 166/255, blue: 255/255, alpha: 1)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let message = menuOptions[indexPath.row] as? String
        if message == "List"{
            
        }
        else if message == "Camera Mode"{
            
            self.contentView.subviews.forEach({ $0.removeFromSuperview() }) // this gets things done
        }
        else if message == "Map View"{
            self.contentView.subviews.forEach({ $0.removeFromSuperview() }) // this gets things done
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "MapMode")
            self.present(controller, animated: true, completion: nil)
            
            SharedDesignObject.fill(Container: self.contentView, inView: controller.view, andBottom: 0, andTop: 0, andLeading: 0, andTrailing: 0)
        }
        else if message == "Settings"{
            self.contentView.subviews.forEach({ $0.removeFromSuperview() }) // this gets things done
            
        }
        else if message == "Log Out"{
            try! FIRAuth.auth()!.signOut()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
            self.present(controller, animated: true, completion: nil)
        }
        
    }

}

