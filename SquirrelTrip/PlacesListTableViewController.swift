//
//  PlacesListTableViewController.swift
//  squirrelTrip
//
//  Created by Luis F. Bustos Ramirez on 11/11/16.
//  Copyright © 2016 Luis F. Bustos Ramirez. All rights reserved.
//

import UIKit

class PlacesListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var placesFirebase = PlacesListFirebase.init()
    
    
    @IBOutlet weak var FilterSegmentedControl: UISegmentedControl!
    @IBOutlet weak var placesTV: UITableView!
    @IBOutlet weak var addPlaceBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placesFirebase.getListOfPlaces()
        placesTV.register(UINib(nibName: "PlacesTableViewCell", bundle:nil), forCellReuseIdentifier: "PlacesTableViewCell")
        placesTV.dataSource = self
        placesTV.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func changeFilter(_ sender: Any) {
        
    }
    @IBAction func addPlace(_ sender: Any) {
        placesFirebase.writeNewPlace()
    }

    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlacesTableViewCell", for: indexPath) as! PlacesTableViewCell
        //let place = placeBD.places[indexPath.row]
        
       // cell.lblName.text = place.value(forKey: "name") as! String?
        cell.viewRnkng.rating = 2.5
        
        return cell
    }
    
    
}
