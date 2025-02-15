//
//  MonsterTableUtils.swift
//  pad-db
//
//  Created by Rohil Thopu on 1/11/19.
//  Copyright © 2019 Rohil Thopu. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension MonsterTable {
    
    @objc
    func changeSort() {
        if isDescendedSort {
            isDescendedSort = false
            sortMonstersAscending()
            tableView.reloadData()
        }
        else {
            isDescendedSort = true
            sortMonstersDescending()
            tableView.reloadData()
        }
    }
    
    func sortMonstersDescending() {
        goodMonsters.sort{
            let first = $0.cardID
            let second = $1.cardID
            
            return first > second
        }
    }
    
    func sortMonstersAscending() {
        goodMonsters.sort{
            let first = $0.cardID
            let second = $1.cardID
            return first < second
        }
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return monsterSearchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForText(_ searchText: String, scope: String = "All") {
        let tokenText = getTokenList(forSearchQuery: searchText)
        filteredMonsters = goodMonsters.filter({
            let val = getTokenList(forSearchQuery: $0.name)
            let id = String($0.cardID)
            return id.contains(searchText.lowercased()) || $0.name.lowercased().contains(searchText.lowercased()) || tokenText.isSubset(of: val)
        })
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return monsterSearchController.isActive && !searchBarIsEmpty()
    }

}
