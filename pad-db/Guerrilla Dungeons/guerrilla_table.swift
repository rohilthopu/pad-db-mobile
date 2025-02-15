//
//  GuerrillaTableViewController.swift
//  pad-db
//
//  Created by Rohil Thopu on 12/19/18.
//  Copyright © 2018 Rohil Thopu. All rights reserved.
//

import UIKit
import SwiftyJSON
import CoreData
import Just


class GuerrillaTable: UITableViewController {
    
    let cellid = "guerrillacell"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl!.addTarget(self, action: #selector(refreshGuerrillaList(_:)), for: .valueChanged)
        tableView.register(GuerrillaCell.self, forCellReuseIdentifier: cellid)
        tableView.rowHeight = 85
        self.definesPresentationContext = true
        
        setupNavBar()
        getLiveGuerrillaData()
        getLiveMonsterData()
        getLiveSkillData()
        getLiveDungeonData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if changeSettings {
            updateGuerrillaViewNA()
            updateGuerrillaViewJP()
        }
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayDungeons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! GuerrillaCell
        
        let dungeon = displayDungeons[indexPath.row]
        cell.name = dungeon.name!
        cell.group = dungeon.group!
        cell.status = dungeon.status!
        cell.remainingTime = dungeon.remainingTime!
        if let imgLink = dungeon.imgLink {
            cell.imgLink = imgLink
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        let gDungeon = displayDungeons[index]
        let currentDungeon = getDungeon(forID: gDungeon.dungeonID!)
        
        if let currentDungeon = currentDungeon {
            let floorListTable = FloorTable()
            floorListTable.dungeon_floors = getFloors(for: currentDungeon)
            floorListTable.navigationItem.title = (currentDungeon.name)
            self.navigationController?.pushViewController(floorListTable, animated: true)
        }
    }
}
