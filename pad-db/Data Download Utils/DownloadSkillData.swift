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

func getSkillData() {
    
    if let url = URL(string: skill_api_link) {
        if let data = try? String(contentsOf: url) {
            let json = JSON(parseJSON: data)
            for item in json.arrayValue {
                
                var skill:Skill = Skill()
                skill.name = item["name"].stringValue
                skill.description = item["description"].stringValue
                skill.skillID = item["skillID"].int
                skill.skillType = item["skill_type"].stringValue
                skill.hpMult = item["hp_mult"].floatValue
                skill.atkMult = item["atk_mult"].floatValue
                skill.rcvMult = item["rcv_mult"].floatValue
                skill.dmgReduction = item["dmg_reduction"].doubleValue
                skill.cSkill1 = item["c_skill_1"].intValue
                skill.cSkill2 = item["c_skill_2"].intValue
                skill.cSkill3 = item["c_skill_3"].intValue
                skill.skillClass = item["skill_class"].stringValue
                skill.levels = item["levels"].intValue
                skill.minTurns = item["minTurns"].intValue
                skill.maxTurns = item["maxTurns"].intValue
                
                rawSkills.append(skill)
            }
        }
    }
}

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
                enemySkills.append(item)
            }
        }
    }
    
    do {
        try managedContext.save()
    }
    catch _ as NSError {
        print("Error saving enemy skills in CoreData")
    }
}

func saveSkillData() {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate  else { return }
    let managedContext = appDelegate.persistentContainer.viewContext
    let entity = NSEntityDescription.entity(forEntityName: "SkillNA", in: managedContext)!
    
    for skill in rawSkills {
        if let id = skill.skillID {
            if skillIDList[id] == nil {
                let item = NSManagedObject(entity: entity, insertInto: managedContext)
                item.setValue(skill.name, forKey: "name")
                item.setValue(skill.description, forKey: "desc")
                item.setValue(skill.skillID, forKey: "skillID")
                item.setValue(skill.skillType, forKey: "skillType")
                item.setValue(skill.hpMult, forKey: "hpMult")
                item.setValue(skill.atkMult, forKey: "atkMult")
                item.setValue(skill.rcvMult, forKey: "rcvMult")
                item.setValue(skill.dmgReduction, forKey: "dmgReduction")
                item.setValue(skill.cSkill1, forKey: "cSkill1")
                item.setValue(skill.cSkill2, forKey: "cSkill2")
                item.setValue(skill.cSkill3, forKey: "cSkill3")
                item.setValue(skill.skillClass, forKey: "skillClass")
                item.setValue(skill.levels, forKey: "levels")
                item.setValue(skill.minTurns, forKey: "minTurns")
                item.setValue(skill.maxTurns, forKey: "maxTurns")
            }
        }
    }
    do {
        try managedContext.save()
    }
    catch _ as NSError {
        print("Error saving skills in CoreData")
    }
}
