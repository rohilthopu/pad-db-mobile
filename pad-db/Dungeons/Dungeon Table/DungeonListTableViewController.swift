//
//  DungeonTableViewController.swift
//  pad-db
//
//  Created by Rohil Thopu on 1/24/19.
//  Copyright © 2019 Rohil Thopu. All rights reserved.
//

import UIKit
import CoreData
import Kingfisher

var dungeons = [NSManagedObject]()
var floors = [NSManagedObject]()

class DungeonListTableViewController: UITableViewController {
    
    let cellid = "dungeoncell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.tableView.register(DungeonCell.self, forCellReuseIdentifier: cellid)
        self.tableView.rowHeight = 100
        self.tableView.allowsSelection = false
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dungeons.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! DungeonCell
        
        cell.dungeon = dungeons[indexPath.row]

        return cell
    }

}
