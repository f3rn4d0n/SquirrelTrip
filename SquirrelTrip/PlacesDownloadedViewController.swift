//
//  PlacesDownloadedViewController.swift
//  SquirrelTrip
//
//  Created by Luis F. Bustos Ramirez on 07/06/17.
//  Copyright © 2017 Luis Fernando Bustos Ramírez. All rights reserved.
//

import UIKit

class PlacesDownloadedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var placeBD = PlaceDB.init()
    
    @IBOutlet weak var placesTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if placeBD.countPlaces() < 2{
            placeBD.addTempPlaces()
        }
        print(placeBD.countPlaces())
        placesTV.register(UINib(nibName: "PlacesTableViewCell", bundle:nil), forCellReuseIdentifier: "PlacesTableViewCell")
        placesTV.dataSource = self
        placesTV.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeBD.countPlaces()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlacesTableViewCell", for: indexPath) as! PlacesTableViewCell
        let place = placeBD.places[indexPath.row]
        
        cell.lblName.text = place.value(forKey: "name") as! String?
        cell.viewRnkng.rating = 2.5
        
        return cell
    }
    
    
}
