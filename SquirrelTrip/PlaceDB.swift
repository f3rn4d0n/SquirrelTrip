//
//  PlaceDB.swift
//  squirrelTrip
//
//  Created by Luis F. Bustos Ramirez on 11/11/16.
//  Copyright © 2016 Luis F. Bustos Ramirez. All rights reserved.
//

import UIKit
import CoreData


class PlaceDB{
    var places = [NSManagedObject]()
    private let tableName = "Places"
    
    
    func countPlaces() -> Int{
        return places.count
    }
    
    func getPlacesBy(_ id:Int) -> NSManagedObject{
        return places[id]
    }
    
    func savePlace(_ placeDic:NSDictionary) -> Bool{
        var process = false
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: tableName, in: context)
        let place = NSManagedObject(entity: entity!, insertInto: context)
        place.setValue(placeDic["name"], forKey: "name")
        place.setValue(placeDic["desc"], forKey: "desc")
        place.setValue(placeDic["lat"], forKey: "lat")
        place.setValue(placeDic["lon"], forKey: "lon")
        place.setValue(placeDic["ranking"], forKey: "ranking")
        
        do{
            process = true
            try context.save()
            places.append(place)
        } catch let error as NSError{
            print("Could not save \(error), \(error.userInfo)")
        }
        return process
    }
    
    init(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: tableName)
        do{
            let results = try context.fetch(fetchRequest)
            places = results as! [NSManagedObject]
        }catch let error as NSError{
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func addTempPlaces(){
        let dic1:NSDictionary = ["name":"Prueba","lat":"1.2321323","lon":"-98.3432423","desc":"Realizando un test","ranking":2.5]
        savePlace(dic1)
        let dic2:NSDictionary = ["name":"Prueba1","lat":"1.2321323","lon":"-98.3432423","desc":"Realizando un test","ranking":4.0]
        savePlace(dic2)
    }
    
}
