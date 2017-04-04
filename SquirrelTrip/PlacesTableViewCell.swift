//
//  PlacesTableViewCell.swift
//  squirrelTrip
//
//  Created by Luis F. Bustos Ramirez on 01/11/16.
//  Copyright © 2016 Luis F. Bustos Ramirez. All rights reserved.
//

import UIKit
import Cosmos

class PlacesTableViewCell: UITableViewCell {

    @IBOutlet var lblName: UILabel!
    @IBOutlet var viewRnkng: CosmosView!
    @IBOutlet var lblTime: UILabel!
    @IBOutlet var lblKm: UILabel!
    @IBOutlet var imgPlace: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func customizeView(){
                
        
        
    }
}
