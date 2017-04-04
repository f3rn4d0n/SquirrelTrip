//
//  PlacesDetailTableViewController.swift
//  squirrelTrip
//
//  Created by Luis F. Bustos Ramirez on 07/11/16.
//  Copyright © 2016 Luis F. Bustos Ramirez. All rights reserved.
//

import UIKit
import MapKit
import AVFoundation

class PlacesDetailTableViewController: UITableViewController {

    @IBOutlet var scrollImgs: UIScrollView!
    @IBOutlet var pageCntrllrImgNum: UIPageControl!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var sliderMusic: UISlider!
    @IBOutlet var btnPlay: UIButton!
    @IBOutlet var txtViewDesc: UITextView!
    @IBOutlet var mapLocation: MKMapView!
    @IBOutlet var cntentViewEvents: UICollectionView!
    @IBOutlet var tableReviews: UITableView!
    @IBOutlet var writeReview: UIButton!
    @IBOutlet var seeAllReviews: UIButton!
    
    
    var languages = [language]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.prepareLenguaje()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    func prepareLenguaje(){
        let french = language(name: "Frances", iso639: "fr-FR")
        let spanishMX = language(name: "Español-MX", iso639: "es-MX")
        let english = language(name: "Ingles", iso639: "en-US")
        let chinese = language(name: "Chino", iso639: "zh-CN")
        languages = [spanishMX!, english!, french!, chinese!]
    }
    
    @IBAction func translate(_ sender: AnyObject) {
        var languageSelected: String
        
        languageSelected = languages[1].iso639
        
        let textToSpech = txtViewDesc.text
        
        // Do any additional setup after loading the view, typically from a nib.
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: textToSpech as String!) //oration to say
        utterance.rate = 0.5 //speed to talk
        utterance.pitchMultiplier = 0.25 //Tono
        utterance.volume = 0.75 //Volume to voice
        utterance.voice = AVSpeechSynthesisVoice(language: languageSelected) //we can costumner the lenguaje
        synthesizer.speak(utterance);
        
        //utterance.pauseSpeakingAtBoundary()
        
        //utterance.stopSpeakingAtBundary()
        
        //synthesizer.stopSpeakingAtBundary(AVSpeechBoundary.Inmediate)
    
    
    }

}
