//
//  DownloadMonsterData.swift
//  pad-db
//
//  Created by Rohil Thopu on 1/31/19.
//  Copyright © 2019 Rohil Thopu. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import CoreData
import Just

func getLiveMonsterData() {
    
    let data = Just.get(monster_list_api_hook).content
    
    if let data = data {
        do {
            monsters = try JSONDecoder().decode([MonsterListItem].self, from: data)
        } catch let error as NSError {
            print(error)
        }
    }
}
