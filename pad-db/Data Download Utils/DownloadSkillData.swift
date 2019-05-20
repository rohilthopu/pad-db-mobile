//
//  DownloadSkillData.swift
//  pad-db
//
//  Created by Rohil Thopu on 1/31/19.
//  Copyright © 2019 Rohil Thopu. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import CoreData

func getEnemySkillData() {
    
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate  else { return }
    let managedContext = appDelegate.persistentContainer.viewContext
    let entity = NSEntityDescription.entity(forEntityName: "EnemySkill", in: managedContext)!
    
    if let url = URL(string: enemy_skill_api_url) {
        if let data = try? String(contentsOf: url) {
            let json = JSON(parseJSON: data)
            for skill in json.arrayValue {
                let item = NSManagedObject(entity: entity, insertInto: managedContext)
                item.setValue(skill["name"].stringValue, forKey: "name")
                item.setValue(skill["effect"].stringValue, forKey: "effect")
                item.setValue(skill["enemy_skill_id"].intValue, forKey: "enemy_skill_id")
            }
        }
        do {
            try managedContext.save()
        }
        catch _ as NSError {
            print("Error saving enemy skills in CoreData")
        }
    }
}

func getLiveSkillData() {
    
    let url = URL(string: skill_api_link)!
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        
        // ensure there is no error for this HTTP response
        guard error == nil else {
            print ("error: \(error!)")
            return
        }
        
        // ensure there is data returned from this HTTP response
        guard let data = data else {
            print("No data")
            return
        }
        
        do {
            skills = try JSONDecoder().decode([Skill].self, from: data)
        } catch let error as NSError{
            print(error)
        }
    }
    
    // execute the HTTP request
    task.resume()
}
