//
//  DownloadGuerrillaData.swift
//  pad-db
//
//  Created by Rohil Thopu on 1/31/19.
//  Copyright © 2019 Rohil Thopu. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import Just

func getLiveGuerrillaData() {
    let timeInMS = NSDate().timeIntervalSince1970
    
    allGuerrillaDungeons.removeAll()
    if let url = URL(string: guerrilla_api_hook) {
        if let data = try? String(contentsOf: url) {
            let json = JSON(parseJSON: data)
            for item in json.arrayValue {
                var dungeon:Guerrilla = Guerrilla()
                
                let endSecs = item["end_secs"].doubleValue
                let startSecs = item["start_secs"].doubleValue
                
                
                if ((timeInMS >= startSecs) && (timeInMS <= endSecs)) {
                    dungeon.remainingTime = (endSecs - timeInMS)
                    dungeon.status = "Active"
                }
                else if (timeInMS < startSecs) {
                    dungeon.remainingTime = startSecs - timeInMS
                    dungeon.status = "Upcoming"
                }
                else {
                    dungeon.remainingTime = 0
                }
                
                if dungeon.remainingTime! != 0 {
                    dungeon.name = item["name"].stringValue
                    dungeon.startTime = item["start_time"].stringValue
                    dungeon.endTime = item["end_time"].stringValue
                    dungeon.startSecs = item["start_secs"].floatValue
                    dungeon.endSecs = item["end_secs"].floatValue
                    dungeon.server = item["server"].stringValue
                    dungeon.group = item["group"].stringValue
                    dungeon.dungeonID = item["dungeon_id"].intValue
                    dungeon.imgID = item["image_id"].intValue
                    dungeon.imgLink = getPortraitURL(id: dungeon.imgID!)

                    allGuerrillaDungeons.append(dungeon)
                }
            }
        }
        updateGuerrillaViewNA()
        updateGuerrillaViewJP()
    }
    
    if showingNA {
        displayDungeons = naDungeons
    } else {
        displayDungeons = jpDungeons
    }
}


