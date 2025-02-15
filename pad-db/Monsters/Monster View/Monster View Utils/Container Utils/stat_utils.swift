//
//  MonsterVCSetupNameUtils.swift
//  pad-db
//
//  Created by Rohil Thopu on 1/13/19.
//  Copyright © 2019 Rohil Thopu. All rights reserved.
//

import Foundation
import UIKit

extension MonsterView {
    public func setupStatusContainer() {
        // TODO
        setupLevelStatus()
        setupHPStatus()
        setupATKStatus()
        setupRCVStatus()
        setupWeightedStats()
        
        
        let separator = makeSeparator()
        statContainer.addSubview(separator)
        scrollView.addSubview(statContainer)
        
        statContainer.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        statContainer.topAnchor.constraint(equalTo: nameContainer.bottomAnchor, constant: 20).isActive = true
        statContainer.widthAnchor.constraint(equalToConstant: spacing*35).isActive = true
        
        
        separator.centerXAnchor.constraint(equalTo: statContainer.centerXAnchor).isActive = true
        separator.bottomAnchor.constraint(equalTo: statContainer.bottomAnchor).isActive = true
    }
    
    public func setupLevelStatus() {
        
        // labels for the status
        
        let levelLabel = makeLabel(ofSize: 20, withText: "lvl")
        let minLevelLabel = makeLabel(ofSize: 16, withText: "1")
        let maxLevelLabel = makeLabel(ofSize: 16, withText: String(monster.maxLevel))
        let label297 = makeLabel(ofSize: 16, withText: "+297")
        
        levelContainer.addSubview(levelLabel)
        levelContainer.addSubview(minLevelLabel)
        levelContainer.addSubview(maxLevelLabel)
        levelContainer.addSubview(label297)
        
        statContainer.addSubview(levelContainer)
        
        
        // add constraints to the level container object first
        
        levelContainer.leadingAnchor.constraint(equalTo: statContainer.leadingAnchor).isActive = true
        levelContainer.topAnchor.constraint(equalTo: statContainer.topAnchor).isActive = true
        
        // add constraints to the level items/values
        
//        levelLabel.leadingAnchor.constraint(equalTo: levelContainer.leadingAnchor).isActive = true
        levelLabel.topAnchor.constraint(equalTo: levelContainer.topAnchor).isActive = true
        
        // add constraint to the min level
        
        minLevelLabel.topAnchor.constraint(equalTo: levelLabel.bottomAnchor, constant: 20).isActive = true
        minLevelLabel.centerXAnchor.constraint(equalTo: levelLabel.centerXAnchor).isActive = true
        
        
        // add constraint to the max level
        
        maxLevelLabel.topAnchor.constraint(equalTo: minLevelLabel.bottomAnchor, constant: 20).isActive = true
        maxLevelLabel.centerXAnchor.constraint(equalTo: levelLabel.centerXAnchor).isActive = true

        
        label297.leadingAnchor.constraint(equalTo: levelContainer.leadingAnchor).isActive = true
        label297.topAnchor.constraint(equalTo: maxLevelLabel.bottomAnchor, constant: 20).isActive = true
        label297.trailingAnchor.constraint(equalTo: levelContainer.trailingAnchor).isActive = true
        label297.bottomAnchor.constraint(equalTo: levelContainer.bottomAnchor).isActive = true
        label297.centerXAnchor.constraint(equalTo: levelLabel.centerXAnchor).isActive = true

    }
    
    public func setupHPStatus() {
        
        // hp labels
        let HPLabel: UILabel = makeLabel(ofSize: 20, withText: "hp")
        let minHPLabel: UILabel = makeLabel(ofSize: 16, withText: String(monster.minHP))
        let maxHPLabel: UILabel = makeLabel(ofSize: 16, withText: String(monster.maxHP))
        let hp297: UILabel = makeLabel(ofSize: 16, withText: String(monster.maxHP + 990))
        
        HPContainer.addSubview(HPLabel)
        HPContainer.addSubview(minHPLabel)
        HPContainer.addSubview(maxHPLabel)
        HPContainer.addSubview(hp297)
        
        statContainer.addSubview(HPContainer)
        
        // add constraints to the level container object first
        
        HPContainer.leadingAnchor.constraint(equalTo: levelContainer.trailingAnchor, constant: spacing*7).isActive = true
        HPContainer.topAnchor.constraint(equalTo: statContainer.topAnchor).isActive = true
        
        // add constraints to the level items/values
        
        HPLabel.topAnchor.constraint(equalTo: HPContainer.topAnchor).isActive = true
        
        // add constraint to the min level
        
        minHPLabel.topAnchor.constraint(equalTo: HPLabel.bottomAnchor, constant: 20).isActive = true
        minHPLabel.centerXAnchor.constraint(equalTo: HPLabel.centerXAnchor).isActive = true
        
        // add constraint to the max level
        
        maxHPLabel.topAnchor.constraint(equalTo: minHPLabel.bottomAnchor, constant: 20).isActive = true
        maxHPLabel.centerXAnchor.constraint(equalTo: HPLabel.centerXAnchor).isActive = true

        
        hp297.leadingAnchor.constraint(equalTo: HPContainer.leadingAnchor).isActive = true
        hp297.topAnchor.constraint(equalTo: maxHPLabel.bottomAnchor, constant: 20).isActive = true
        hp297.trailingAnchor.constraint(equalTo: HPContainer.trailingAnchor).isActive = true
        hp297.bottomAnchor.constraint(equalTo: HPContainer.bottomAnchor).isActive = true
        hp297.centerXAnchor.constraint(equalTo: HPLabel.centerXAnchor).isActive = true

        
    }
    
    public func setupATKStatus() {
    
        let ATKLabel: UILabel = makeLabel(ofSize: 20, withText: "atk")
        let minATKLabel: UILabel = makeLabel(ofSize: 16, withText: String(monster.minAtk))
        let maxATKLabel: UILabel = makeLabel(ofSize: 16, withText: String(monster.maxAtk))
        let atk297: UILabel = makeLabel(ofSize: 16, withText: String(monster.maxAtk + 495))
        
        ATKContainer.addSubview(ATKLabel)
        ATKContainer.addSubview(minATKLabel)
        ATKContainer.addSubview(maxATKLabel)
        ATKContainer.addSubview(atk297)
        
        statContainer.addSubview(ATKContainer)
        
        // add constraints to the level container object first
        
        ATKContainer.leadingAnchor.constraint(equalTo: HPContainer.trailingAnchor, constant: spacing*7).isActive = true
        ATKContainer.topAnchor.constraint(equalTo: statContainer.topAnchor).isActive = true
        
        // add constraints to the level items/values
        
        ATKLabel.topAnchor.constraint(equalTo: ATKContainer.topAnchor).isActive = true
        // add constraint to the min level
        
        minATKLabel.topAnchor.constraint(equalTo: ATKLabel.bottomAnchor, constant: 20).isActive = true
        minATKLabel.centerXAnchor.constraint(equalTo: ATKLabel.centerXAnchor).isActive = true
        
        // add constraint to the max level
        
        maxATKLabel.topAnchor.constraint(equalTo: minATKLabel.bottomAnchor, constant: 20).isActive = true
        maxATKLabel.centerXAnchor.constraint(equalTo: ATKLabel.centerXAnchor).isActive = true

        
        atk297.leadingAnchor.constraint(equalTo: ATKContainer.leadingAnchor).isActive = true
        atk297.topAnchor.constraint(equalTo: maxATKLabel.bottomAnchor, constant: 20).isActive = true
        atk297.trailingAnchor.constraint(equalTo: ATKContainer.trailingAnchor).isActive = true
        atk297.bottomAnchor.constraint(equalTo: ATKContainer.bottomAnchor).isActive = true
        atk297.centerXAnchor.constraint(equalTo: ATKLabel.centerXAnchor).isActive = true
    }
    
    public func setupRCVStatus() {
        // rcv labels
        let RCVLabel: UILabel = makeLabel(ofSize: 20, withText: "rcv")
        let minRCVLabel: UILabel = makeLabel(ofSize: 16, withText: String(monster.minRcv))
        let maxRCVLabel: UILabel = makeLabel(ofSize: 16, withText: String(monster.maxRcv))
        let rcv297: UILabel = makeLabel(ofSize: 16, withText: String(monster.maxRcv + 297))
        
        RCVContainer.addSubview(RCVLabel)
        RCVContainer.addSubview(minRCVLabel)
        RCVContainer.addSubview(maxRCVLabel)
        RCVContainer.addSubview(rcv297)
        
        statContainer.addSubview(RCVContainer)
        
        // add constraints to the level container object first
        
        RCVContainer.leadingAnchor.constraint(equalTo: ATKContainer.trailingAnchor, constant: spacing*7).isActive = true
        RCVContainer.topAnchor.constraint(equalTo: statContainer.topAnchor).isActive = true
        
        // add constraints to the level items/values
        
        RCVLabel.topAnchor.constraint(equalTo: RCVContainer.topAnchor).isActive = true
        
        // add constraint to the min level
        
        minRCVLabel.topAnchor.constraint(equalTo: RCVLabel.bottomAnchor, constant: 20).isActive = true
        minRCVLabel.centerXAnchor.constraint(equalTo: RCVLabel.centerXAnchor).isActive = true
        
        // add constraint to the max level
        
        maxRCVLabel.topAnchor.constraint(equalTo: minRCVLabel.bottomAnchor, constant: 20).isActive = true
        maxRCVLabel.centerXAnchor.constraint(equalTo: RCVLabel.centerXAnchor).isActive = true

        
        rcv297.leadingAnchor.constraint(equalTo: RCVContainer.leadingAnchor).isActive = true
        rcv297.topAnchor.constraint(equalTo: maxRCVLabel.bottomAnchor, constant: 20).isActive = true
        rcv297.trailingAnchor.constraint(equalTo: RCVContainer.trailingAnchor).isActive = true
        rcv297.bottomAnchor.constraint(equalTo: RCVContainer.bottomAnchor).isActive = true
        rcv297.centerXAnchor.constraint(equalTo: RCVLabel.centerXAnchor).isActive = true

        
    }
    
    public func setupWeightedStats() {
        let hp = Double(monster.maxHP)/10
        let atk = Double(monster.maxAtk)/5
        let rcv = Double(monster.maxRcv)/3
        let weighted = hp + atk + rcv
        
        let weightedStatsLabel: UILabel = makeLabel(ofSize: 16, withText: "Weighted stats: " + String(format: "%.2f", weighted))
        statContainer.addSubview(weightedStatsLabel)
        weightedStatsLabel.leadingAnchor.constraint(equalTo: statContainer.leadingAnchor).isActive = true
        weightedStatsLabel.trailingAnchor.constraint(equalTo: statContainer.trailingAnchor).isActive = true
        weightedStatsLabel.topAnchor.constraint(equalTo: levelContainer.bottomAnchor, constant: 20).isActive = true
        weightedStatsLabel.bottomAnchor.constraint(equalTo: statContainer.bottomAnchor, constant: -10).isActive = true
    }
}
