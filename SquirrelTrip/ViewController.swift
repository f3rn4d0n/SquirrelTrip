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
    @IBOutlet weak var widthBackBtnConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var viewPresented: NSString!
    var controller: UIViewController!
    var lastView: String!
    var menuOptions: NSMutableArray = []
    
    //MARK: Prepare interface
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        trailingTVConstraint.constant = -240
        widthBackBtnConstraint.constant = 0
        self.view.layoutIfNeeded()
        getListOfMenuOptions()
        titleLbl.text = "Home"
        fill(ViewName: "PlacesList", andBottom: 0, andTop: 0, andLeading: 0, andTrailing: 0)
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeToDetailView), name: NSNotification.Name(rawValue: "com.SquirrelTrip.SeeDetail"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeToBadgesView), name: NSNotification.Name(rawValue: "com.SquirrelTrip.SeeBadges"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getListOfMenuOptions(){
        menuOptions = ["Profile", "Home", "Camera", "Map", "My dowloads", "Settings", "Log Out"]
    }
    
    
    //MARK: Buttons behavior
    @IBAction func menuAction(_ sender: Any) {
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
    
    @IBAction func backAction(_ sender: Any) {
        changeToView(named: lastView)
        widthBackBtnConstraint.constant = 0
        self.view.layoutIfNeeded()
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
        cell?.textLabel?.textColor = UIColor.white
        cell?.backgroundColor = UIColor.init(red: 57/255, green: 166/255, blue: 255/255, alpha: 1)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.trailingTVConstraint.constant = 0
            self.view.layoutIfNeeded()
        }, completion: { (finished: Bool) in
            tableView.deselectRow(at: indexPath, animated: true)
        })
        let message = menuOptions[indexPath.row] as! String
        changeToView(named: message)
    }
    
    
    //MARK: Change of view
    func changeToView(named message: String){
        titleLbl.text = message
        lastView = message
        if message == "Profile"{
            fill(ViewName: "Profile", andBottom: 0, andTop: 0, andLeading: 0, andTrailing: 0)
        }
        else if message == "Home"{
            fill(ViewName: "PlacesList", andBottom: 0, andTop: 0, andLeading: 0, andTrailing: 0)
        }
        else if message == "Camera"{
            fill(ViewName: "CameraMode", andBottom: 0, andTop: 0, andLeading: 0, andTrailing: 0)
        }
        else if message == "Map"{
            fill(ViewName: "MapMode", andBottom: 0, andTop: 0, andLeading: 0, andTrailing: 0)
        }
        else if message == "Settings"{
            fill(ViewName: "Settings", andBottom: 0, andTop: 0, andLeading: 0, andTrailing: 0)
        }
        else if message == "My dowloads"{
            fill(ViewName: "Dowloads", andBottom: 0, andTop: 0, andLeading: 0, andTrailing: 0)
        }
        else if message == "Log Out"{
            try! FIRAuth.auth()!.signOut()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    func fill(ViewName name: NSString, andBottom bottom:NSInteger, andTop top:NSInteger, andLeading leading:NSInteger, andTrailing trailing:NSInteger){
        self.contentView.subviews.forEach({ $0.removeFromSuperview() })
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewController(withIdentifier: name as String)
        addChildViewController(controller)
        
        let constraintTop = NSLayoutConstraint(item: controller.view!, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1.0, constant: CGFloat(top))
        
        let constraintLeading = NSLayoutConstraint(item: controller.view!, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1.0, constant: CGFloat(leading))
        
        let constraintBottom = NSLayoutConstraint(item: controller.view!, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1.0, constant: CGFloat(bottom))
        
        let constraintTrailing = NSLayoutConstraint(item: controller.view!, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1.0, constant: CGFloat(trailing))
        
        controller.view!.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(controller.view)
        self.contentView.addConstraints([constraintTop, constraintBottom, constraintLeading, constraintTrailing])
        controller.didMove(toParentViewController: self)
    }
    
    
    //MARK: Notifications
    func changeToBadgesView(){
        widthBackBtnConstraint.constant = 20
        self.view.layoutIfNeeded()
        fill(ViewName: "Badges", andBottom: 0, andTop: 0, andLeading: 0, andTrailing: 0)
    }
    
    func changeToDetailView(){
        widthBackBtnConstraint.constant = 20
        self.view.layoutIfNeeded()
        fill(ViewName: "Detail", andBottom: 0, andTop: 0, andLeading: 0, andTrailing: 0)
    }

}

